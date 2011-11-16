package com.era7.bioinfo.bio4j.services.comm
{
	import com.era7.bioinfo.xml.go.SlimSet;
	import com.era7.communication.interfaces.ServerCallable;
	import com.era7.communication.interfaces.ServerUploadable;
	import com.era7.communication.model.BasicMapper;
	import com.era7.communication.xml.Parameters;
	import com.era7.communication.xml.Request;
	import com.era7.util.debug.Debugger;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	import mx.controls.Alert;
	import mx.controls.DataGrid;
	
	public class ProteinMapper extends BasicMapper
	{
		
		public function ProteinMapper()
		{
			super();
		}
		
		public function downloadProteinMultifasta(proteins:XML):void{
			
			var temp:Request = new Request();
			temp.setMethod(RequestList.DOWNLOAD_PROTEIN_MULTIFASTA_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(proteins);
			params.addParametersContent(<file_name>ProteinMultifasta</file_name>);
			
			temp.setParameters(params);
			
			var urlRequest:URLRequest = new URLRequest(UrlManager.DOWNLOAD_PROTEIN_MULTIFASTA_URL);
			
			urlRequest.method = URLRequestMethod.POST;
			var vars:URLVariables = new URLVariables();		
						
			vars.request = temp.toString();
			urlRequest.data = vars; 
			
			navigateToURL(urlRequest,"_self");
			
		}
		
		public function getProteinMultifastaResultInS3(url:String,
								bucketName:String,
								fileName:String,
								serverCallable:ServerCallable):void{
			
			var temp:Request = new Request();
			temp.setMethod(RequestList.GET_PROTEIN_MULTIFASTA_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(<url>{url}</url>);
			params.addParametersContent(<file_name>{fileName}</file_name>);
			params.addParametersContent(<bucket_name>{bucketName}</bucket_name>);
			
			temp.setParameters(params);
			
			this.mainManager.loadRequest(temp,serverCallable,UrlManager.GET_PROTEIN_MULTIFASTA_URL);
			
		}
		
		public function getProteinAccessionsForGeneNames(url:String,
													   bucketName:String,
													   fileName:String,
													   serverCallable:ServerCallable):void{
			
			var temp:Request = new Request();
			temp.setMethod(RequestList.GET_GENE_UNIPROT_ACCESSIONS_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(<url>{url}</url>);
			params.addParametersContent(<file_name>{fileName}</file_name>);
			params.addParametersContent(<bucket_name>{bucketName}</bucket_name>);
			
			temp.setParameters(params);
			
			this.mainManager.loadRequest(temp,serverCallable,UrlManager.GET_GENE_UNIPROT_ACCESSIONS_URL);
			
		}
		
		public function getCuffLinksFullReport(inputBucketName:String,
											   inputFileName:String,
											   outputBucketName:String,
											   outputFileName:String,
											   serverCallable:ServerCallable):void{
			
			var temp:Request = new Request();
			temp.setMethod(RequestList.GET_CUFFLINKS_FULL_REPORT_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(<input_bucket>{inputBucketName}</input_bucket>);
			params.addParametersContent(<input_file_name>{inputFileName}</input_file_name>);
			params.addParametersContent(<output_bucket_name>{outputBucketName}</output_bucket_name>);
			params.addParametersContent(<output_file_name>{outputFileName}</output_file_name>);
			
			temp.setParameters(params);
			
			this.mainManager.loadRequest(temp,serverCallable,UrlManager.GET_CUFFLINKS_FULL_REPORT_URL);
			
		}
		
		
	}
}