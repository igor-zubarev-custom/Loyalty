package dynamusic;

import java.util.Collection;

import javax.transaction.TransactionManager;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.repository.MutableRepository;
import atg.repository.MutableRepositoryItem;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;

public class LoyaltyManager extends GenericService {
	private TransactionManager transactionManager;
	private Repository userRepositroy;
	private Repository loyaltyRepository;
	public TransactionManager getTransactionManager() {
		return transactionManager;
	}
	public void setTransactionManager(TransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	public Repository getUserRepositroy() {
		return userRepositroy;
	}
	public void setUserRepositroy(Repository userRepositroy) {
		this.userRepositroy = userRepositroy;
	}
	public Repository getLoyaltyRepository() {
		return loyaltyRepository;
	}
	public void setLoyaltyRepository(Repository loyaltyRepository) {
		this.loyaltyRepository = loyaltyRepository;
	}
	
	public void addLoyaltyToUser(String pUserId, String pLoyaltyId) throws RepositoryException, TransactionDemarcationException {
		System.out.println("addLoyaltyToUser userId " + pUserId + " loyaltyId " + pLoyaltyId);		
		if (isLoggingDebug()){ 
	           logDebug("Adding loyaltyTransaction " + pLoyaltyId + " to user " + pUserId);
		}
		try{
			TransactionDemarcation td = new TransactionDemarcation();
			td.begin(getTransactionManager(), TransactionDemarcation.REQUIRED);
			try {
				MutableRepository mUserRepository = (MutableRepository)getUserRepositroy();
				MutableRepositoryItem mUser = mUserRepository.getItemForUpdate(pUserId, "user");
				Collection userLoyaltyTransactions = (Collection)mUser.getPropertyValue("loyaltyTransactions");
				RepositoryItem loyaltyTransactionForAdd = getLoyaltyRepository().getItem(pLoyaltyId, "loyaltyTransaction");
				if (userLoyaltyTransactions != null && loyaltyTransactionForAdd != null) {
					userLoyaltyTransactions.add(loyaltyTransactionForAdd);				
				}
			} catch (Exception e) {	
				if (isLoggingDebug()){ 
			           logDebug("Exception occured, try to rollback transaction", e);
				}
				if (isLoggingError()) {
                    logError("Exception occured trying to add loyaltyTransaction " + pLoyaltyId + " to user " + pUserId, e);					
				}
				try {
					getTransactionManager().setRollbackOnly();
				} catch (Exception e1) {
					if (isLoggingDebug()){ 
				           logDebug("Fail to rollback transaction", e1);
					}
					if (isLoggingError()) {
	                     logError("Unable to set rollback for transaction", e1);					
					}     
				}
				throw new RepositoryException("Unable to add loyalty transaction " + pLoyaltyId + " to user " + pUserId);
			} finally{
				if (isLoggingDebug()){ 
			           logDebug("End of transaction demarcation reached");
				}
				td.end();
			}
		}catch (TransactionDemarcationException e) {
			if (isLoggingDebug()){ 
		           logDebug("Creating transaction demarcation failed", e);
			}
			if (isLoggingError()) {
	             logError("Creating transaction demarcation failed", e);
			}     
			throw new TransactionDemarcationException("Creating transaction demarcation failed", e);
		}
	}

}
