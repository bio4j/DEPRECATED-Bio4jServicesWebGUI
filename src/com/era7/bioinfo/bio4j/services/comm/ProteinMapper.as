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
								fileName:String):void{
			
			var temp:Request = new Request();
			temp.setMethod(RequestList.GET_PROTEIN_MULTIFASTA_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(<url>{url}</url>);
			params.addParametersContent(<file_name>{fileName}</file_name>);
			params.addParametersContent(<bucket_name>{bucketName}</bucket_name>);
			
			temp.setParameters(params);
			
			var urlRequest:URLRequest = new URLRequest(UrlManager.GET_PROTEIN_MULTIFASTA_URL);
			
			urlRequest.method = URLRequestMethod.POST;
			var vars:URLVariables = new URLVariables();		
			
			vars.request = temp.toString();
			urlRequest.data = vars; 
			
			navigateToURL(urlRequest,"_self");
			
		}
		
		
	}
}