global with sharing class AsyncApex implements Database.Batchable<sObject>, Schedulable, Messaging.InboundEmailHandler {
	//To use a callout in batch Apex, you must specify Database.AllowsCallouts
	//   IE: implements Database.Batchable<sObject>, Database.AllowsCallouts{}
	//use Database.Stateful to maintain state between jobs	
	
	//global or global
	global AsyncApex() {}
	
	
	//--- Scheduled Apex
	global void execute(SchedulableContext ctx) {
			//currently SchedulableContext has one method: getTriggerID
			//use System.abort() to stop execution
			
			//Scheduled logic
			//UtilityClass.method();
			
			}
	
	//--- Batch Apex		 
	global Database.QueryLocator start(Database.BatchableContext BC){
			//similarly, BatchableContext has getJobID method
			
			//update SOQL for your query locator
			return Database.getQueryLocator('SELECT ID FROM Opportunity WHERE Status__c = \'Closed\' AND CreatedDate < LAST_90_DAYS');
			}
			
	global void execute(Database.BatchableContext BC, List<sObject> scope) { 
			//perform logic and DML
			//upsert scope
			}
	
	global void finish(Database.BatchableContext BC) { 
			//send notifications, final clean up
			}
	
	
	//-- Inbound Email		
	global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
	       //inboundEmail has:
	       //binaryAttachments, textAttachments, 
		   //ccAddresses, fromAddress, fromName, replyTo, subject,  toAddresses,
		   //htmlBodyIsTruncated, inReplyTo, messageId, plainTextBody, plainTextBodyIsTruncated, references, headers, htmlBody 
	
		   //Handle email, ie:
		   //UtilityClass.method(email.Subject, email.plainTextBody);
	
		   //assuming everything went well
		   Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
	       result.success = true;
	       return result; 
	       }

	//-- Outbound Email	
	static global Boolean sendEmail(String subject, String body, List<String> toAddresses, Boolean isHTML) {
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
			mail.setToAddresses(toAddresses);
	        mail.setSubject (subject);  
	        if(isHTML) {
				mail.setHTMLBody(body);
			} else {
				mail.setPlainTextBody(body);
			}	
	        Messaging.SendEmailResult []r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
			return r[0].isSuccess();
		}
		

}
