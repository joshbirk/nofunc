public with sharing class VisualforceController {
	/* Example variables
	
	//Transient data that does not get sent back, reduces viewstate
	transient String userName {get; set;}
	
	//Static and/or private vars also do not become part of the viewstate
	static private integer VERSION_NUMBER = 1;
	
	//Public variables for Apex:Form
	public Account testAccount {get; set;}
	public String newName {get; set;}
	
	//You don't need this to return results for RemoteAction, but creates structure
	public class JSONResponse {
		public string message;
		public Account data; //Modify to your actual datatype
		public JSONResponse() {}
	}
	*/
	

	//Custom Controller Constructor
	public VisualforceController() {
	/*	//check the existence of the query parameter
		if(ApexPages.currentPage().getParameters().get('id') == null) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'No Id Found'));
			return;
		}
		
		//check the format of expected parameters - this is good for SOQL injection protection
		if(ApexPages.currentPage().getParameters().get('id').length() != 15 &&
			ApexPages.currentPage().getParameters().get('id').length() != 18) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Not a valid ID pass'));
			return;
		}
		
		List<Account> accountsForId = [SELECT ID, Name from ACCOUNT WHERE Id =: ApexPages.currentPage().getParameters().get('id') LIMIT 1];
		if(accountsForId.size() == 1) {
			testAccount = accountsForId[0];
		} else { //build custom error for messages component
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'There is no account for that ID','Failed SOQL for '+ApexPages.currentPage().getParameters().get('id')));
		} */
		
		//No DML allowed here
	}
	
	//Extension Constructor
	public VisualforceController(ApexPages.StandardController stc) {
	//	testAccount = (Account)stc.getRecord();
		
		//no DML allowed here
	}
	
	
	
	// Example callback functions
	/*
	//Visualforce Form callback, or as an ACTION from the page component
	public PageReference cloneAccount() {
		Account clonedAccount = testAccount.clone();
		clonedAccount.Name = newName; //set via param components on Visualforce
		insert clonedAccount; //DML allowed here 
		
		//return: 
		//null to stay on the same page
		//PageReference with setRedirect(false) = wizard style, viewstate intact
		//PageReference with setRidirect(true) = new page, viewstate flushed
		return null;
	}
	
	//getter - accessible as {!relatedAccounts} in VF
	public List<Account> getRelatedAccounts() {
		String likeString = '%'+testAccount.Name+'%';
		try {
			List<Account> accountsWithNameLike = [SELECT ID, Name from ACCOUNT where Name LIKE :likeString]; 
			return accountsWithNameLike;
			} catch (DMLException e) {
				System.debug(e.getMessage()); //accessible via Developer Console or Debug Logs
				return null;
			}
			
	}
	
	//Asyncronous JavaScript callback.  No viewstate.
	//RemoteAction is static, so has no access to Controller context or variables
	@RemoteAction
	public static VisualforceController.JSONResponse updateResponse(String accountID) {
		JSONResponse json = new JSONResponse();
		try {
			Account a = [SELECT ID, Name from ACCOUNT WHERE Id =:accountID LIMIT 1];
			json.data = a;
			json.message = 'Success';
		} catch (DMLException e) {
			json.message = e.getMessage();
		}
		
		return json;
	}
	*/
	
	/* Cookie Methods */
	/*
	public PageReference setCookies() {
		//Cookie = new Cookie(String name, String value, String path, Integer milliseconds, Boolean isHTTPSOnly)
		Cookie companyName = new Cookie('accountName','TestCo',null,315569260,false); //10 year cookie
		ApexPages.currentPage().setCookies(new Cookie[]{companyName});
		
		return null;
	}
	
	public String getCookieValue() {
		return ApexPages.currentPage().getCookies().get('accountName').getValue();
	}
	*/



	/* Example Test Method
	@isTest
	static public void testVisualforceController() {
		//Set test page
		Test.setCurrentPage(Page.VisualforcePage);
		
		//Set test data
		Account a = new Account(Name='TestCo');
		insert a;
		
		//Set test params
		ApexPages.currentPage().getParameters().put('id',a.Id);
		
		//Construct controller
		VisualforceController vc = new VisualforceController();
		vc.newName = 'TestCo 100';
		
		//Execute Code
		vc.cloneAccount();
		List<Account> accounts = vc.getRelatedAccounts();
		
		//Make assertions
		System.assertEquals(1,accounts.size());
	}
	*/
	

}
