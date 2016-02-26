//generic validation system
//below is an example of the validation array that gets passed
/*

validationRules = Array(
	Array('companyName','Company Name','required',''),
	Array('ABN','ABN','required',''),
	Array('businessOwnersText','Business Owner','required',''),
	Array('phoneNumber','Phone Number','required',''),
	Array('tradeAddress1','Trading Address','required',''),
	Array('tradeCity','Trading Suburb','required',''),
	Array('tradeState','Trading State','required',''),
	Array('tradePostCode','Trading Post Code','required',''),
	Array('tradeCountry','Trading Country','required',''),
	Array('accountingBasis','Accounting Basis','required',''),
	Array('emailAddress','Email Address','compareRequired',Array('emailAddressConfirm'))
	)

*/

/* jquery code to do ajax check on security code before form is submitted. This prevents problems where user enters incorrect security code and loses their form data on the next page */


jQuery(document).ready(function(){
   
	//standard contact form security codes (uses form_security_code)
	jQuery('input[name=form_security_code]').closest('form').each(function(index) {
	
		jQuery(this).bind('submit.security_code_ajax_submit_event',function() {
		
			var security_code=jQuery(this).find('input[name=form_security_code]').val();
			
			//if security code is empty we exit because standard validation should catch this
			if(security_code=='')
			{
				return false;
			}
			
			
			var current_form=jQuery(this);
			
			jQuery.ajax({
				type: 'POST',
				url: '/includes/security-image-ajax-check.php',
				data: 'form_security_code='+security_code,
				success: function(msg){
					if(msg=='SUCCESS')
					{
						//unbind this submit event so we don't enter infinite loop when we submit via submit() method
						current_form.unbind('submit.security_code_ajax_submit_event');
						current_form.submit();
					}
					else
					{
						alert( 'The security code you have entered is incorrect.');
					}
				}
			});
			
			return false;
			
		});
	});
	
	//formy security codes (uses formy_security_code)
	jQuery('input[name=formy_security_code]').closest('form').each(function(index) {
	
		jQuery(this).bind('submit.security_code_ajax_submit_event',function() {
		
			var security_code=jQuery(this).find('input[name=formy_security_code]').val();
			
			//if security code is empty we exit because standard validation should catch this
			if(security_code=='')
			{
				return false;
			}
			
			var current_form=jQuery(this);
			
			jQuery.ajax({
				type: 'POST',
				url: '/includes/security-image-ajax-check.php',
				data: 'form_security_code='+security_code,
				success: function(msg){
					if(msg=='SUCCESS')
					{
						//unbind this submit event so we don't enter infinite loop when we submit via submit() method
						current_form.unbind('submit.security_code_ajax_submit_event');
						current_form.submit();
					}
					else
					{
						alert( 'The security code you have entered is incorrect.');
					}
				}
			});
			
			return false;
			
		});
	});
	
   
 });


function validateForm(validationArray,additionalMessagesArray)
{
	var alerts = new Array();
	var tmpCount = 0;
	var submitOK = true;

	if(additionalMessagesArray)
	{
		for(kk=0;kk<additionalMessagesArray.length;kk++)
		{
			alerts[tmpCount]=additionalMessagesArray[kk];
			tmpCount++;
			submitOK=false;
		}
	}

	for (i=0; i<validationArray.length; i++)
	{
		tmpFieldName=validationArray[i][0];
		tmpFieldDisplayName=validationArray[i][1];
		tmpValidationType=validationArray[i][2];
		tmpValidationArgs=validationArray[i][3];
		tmpFieldValue = document.getElementsByName(tmpFieldName)[0].value;
		if((tmpValidationType=="" || tmpValidationType=="required") && trim(tmpFieldValue)=="")
		{
			alerts[tmpCount] = tmpFieldDisplayName + " is a required field";
			tmpCount++;
			submitOK = false;
		}
		else if(tmpValidationType=="emailAddressRequired")
		{
			if(trim(tmpFieldValue)=="")
			{
				alerts[tmpCount] = tmpFieldDisplayName + " is a required field";
				tmpCount++;
				submitOK = false;
			}
			else
			{
				//var emailRegExp  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				var emailRegExp = /^[^@]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$/;
				
				if(!emailRegExp.test(tmpFieldValue))
				{
					alerts[tmpCount] = tmpFieldDisplayName + " is not a valid email address";
					tmpCount++;
					submitOK = false;
				}
			}
		}
		else if(tmpValidationType=="emailAddressNotRequired")
		{
			if(trim(tmpFieldValue)!="")
			{
				var emailRegExp  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				
				if(!emailRegExp.test(tmpFieldValue))
				{
					alerts[tmpCount] = tmpFieldDisplayName + " is not a valid email address";
					tmpCount++;
					submitOK = false;
				}
			}
		}
		else if(tmpValidationType=="numberRequired")
		{
			if(trim(tmpFieldValue)=="")
			{
				alerts[tmpCount] = tmpFieldDisplayName + " is a required field";
				tmpCount++;
				submitOK = false;
			}
			else
			{				
				if(tmpValidationArgs=='')
				{
					//by leaving blank we let inNumeric function decide default
					strValidChars="";
				}
				else
				{
					strValidChars=tmpValidationArgs;
				}
				if(isNumeric(tmpFieldValue,strValidChars)==false)
				{
					alerts[tmpCount] = tmpFieldDisplayName + " must be numeric";
					tmpCount++;
					submitOK = false;
				}
			}
		}
		else if(tmpValidationType=="numberNotRequired")
		{
			if(tmpFieldValue!="")
			{
				
				if(tmpValidationArgs=='')
				{
					//by leaving blank we let inNumeric function decide default
					strValidChars="";
				}
				else
				{
					strValidChars=tmpValidationArgs;
				}
				if(isNumeric(tmpFieldValue,strValidChars)==false)
				{
					alerts[tmpCount] = tmpFieldDisplayName + " must be numeric";
					tmpCount++;
					submitOK = false;
				}
			}
		}
		else if(tmpValidationType=="compareRequired")
		{
			tmpCompareFieldValue = document.getElementsByName(tmpValidationArgs[0])[0].value;
			if(trim(tmpFieldValue)=="" && trim(tmpCompareFieldValue)=="")
			{
				alerts[tmpCount] = tmpFieldDisplayName + " is a required field";
				tmpCount++;
				submitOK = false;
			}
			else if(tmpFieldValue != tmpCompareFieldValue)
			{
				alerts[tmpCount] = tmpFieldDisplayName + " field does not match the Confirm " + tmpFieldDisplayName + " field";
				tmpCount++;
				submitOK = false;
			}
			
		}
		else if(tmpValidationType=="compareNotRequired")
		{
			tmpCompareFieldValue = document.getElementsByName(tmpValidationArgs[0])[0].value;
			if(tmpFieldValue != tmpCompareFieldValue)
			{
				alerts[tmpCount] = tmpFieldDisplayName + " field does not match the Confirm " + tmpFieldDisplayName + " field";
				tmpCount++;
				submitOK = false;
			}
		}
		else if(tmpValidationType=="radioRequired" || tmpValidationType=="checkboxGroupRequired")
		{
			//can be used for radio buttons, or checkbox groups. checkbox group items should all have same name with array symbox (e.g. services[]).
			var radio_selected = false;

			// Loop from zero to the one minus the number of radio button selections
			for (radiocounter = 0; radiocounter < document.getElementsByName(tmpFieldName).length; radiocounter++)
			{
			
				if (document.getElementsByName(tmpFieldName)[radiocounter].checked)
				{
					radio_selected = true;
				}
			}

			if(radio_selected==false)
			{
				alerts[tmpCount] = tmpFieldDisplayName + " is a required field.";
				tmpCount++;
				submitOK = false;
			}
		}
		else if(tmpValidationType=="checkboxRequired")
		{
			if(document.getElementsByName(tmpFieldName)[0].checked==false)
			{
				alerts[tmpCount] = tmpFieldDisplayName + " must be ticked";
				tmpCount++;
				submitOK = false;
			}
		}
	}
	validationMessage(alerts);
	return submitOK;
}



//Outputs validation popup message in one sentence
function validationMessage(alerts)
{

	if(alerts.length==0)
	{
		return;
	}
	var alertstring = "Please correct the following errors:\n\n";
	
	for (i=0; i<alerts.length; i++)
	{
		alertstring += "- " + alerts[i] + "\n"
	}
	
	alert(alertstring);

}

function checkDomainPrefixValidity(domainPrefix)
{	
	var re = /^[a-z0-9][a-z0-9\-]*$/i;
	var ret=true;

	if(domainPrefix.length<1 || re.test(domainPrefix)==false)
	{
		ret=false;
	}

	return ret;
}



function trim(strText) { 
    // this will get rid of leading spaces 
    while (strText.substring(0,1) == ' ') 
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces 
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

//  check for valid numeric strings	
function isNumeric(strString,strValidChars)
{
	//default to decimal (positive or negative) if strValidChars is empty
	if(strValidChars=="")
	{
		strValidChars = "0123456789.-";
	}
	
	var strChar;
	var blnResult = true;

	if (strString.length == 0) return false;

	//  test strString consists of valid characters listed above
	for (j = 0; j < strString.length && blnResult == true; j++)
	{
		strChar = strString.charAt(j);
		if (strValidChars.indexOf(strChar) == -1)
		{
			blnResult = false;
		}
	}
	return blnResult;
}

function removeSpaces(string)
{
	var tstring = "";
	string = '' + string;
	splitstring = string.split(" ");
	for(k=0; k < splitstring.length; k++)
	{
		tstring += splitstring[k];
	}
	return tstring;
}

function isInternetExplorer()
{
	var detect = navigator.userAgent.toLowerCase();
	pos = detect.indexOf('msie') + 1;
	return pos;
}

function hideTableRows(elementID)
{
	document.getElementById(elementID).style.display='none';
}

function showTableRows(elementID)
{
	if(isInternetExplorer())
	{
		document.getElementById(elementID).style.display='inline';
	}
	else
	{
		document.getElementById(elementID).style.display='table-row-group';
	}
}

function toggleElement(elementID)
{
	if(document.getElementById(elementID).style.display=='none')
	{
		document.getElementById(elementID).style.display='inline';
	}
	else
	{
		document.getElementById(elementID).style.display='none';
	}
}

function hideElement(elementID)
{
	document.getElementById(elementID).style.display='none';
}

function showElement(elementID)
{
	document.getElementById(elementID).style.display='';
}


function orderNowCheckboxChanged()
{
	if(document.getElementById('order_now').checked)
	{
		showTableRows('credit_card_section');
	}
	else
	{
		hideTableRows('credit_card_section');
	}
}

//function to add menu items to adxmenu after rendering using Javascript.
//Originally made to make links that will not be followed by Google.

//set target to '_blank' to open in new window or leave as empty string to open in same window
function addCustomJSMenuItem(menu_ul_name, menu_position, menu_item_name, menu_item_href, menu_item_css_class, menu_item_target)
{
	//this is the UL we are working on (could be the main list of a submenu list)
	var menu_ul=document.getElementById(menu_ul_name);

	var menu_ul_children=menu_ul.childNodes;

	var menu_lis=new Array();

	//loop through child nodes and make array of the LI elements only
	for(var ii=0;ii<menu_ul_children.length;ii++)
	{
		if(menu_ul_children[ii].nodeName=='LI')
		{
			menu_lis.push(menu_ul_children[ii]);
		}
	}

	//here we create the new LI element and the A subelement
	var new_li = document.createElement('li');

	if(menu_item_css_class!='')
	{
		new_li.className=menu_item_css_class;
	}

	//here we check if menu_item_href is set
	//if not, we skip the a tag
	if(menu_item_href!='')
	{
		var new_a = document.createElement('a');
		new_a.href=menu_item_href;

		//here check if this should open in new window
		if(menu_item_target=='_blank')
		{
			new_a.target=menu_item_target;
		}


		new_a.appendChild(document.createTextNode(menu_item_name));
		new_li.appendChild(new_a);
	}
	else
	{
		new_li.appendChild(document.createTextNode(menu_item_name));
	}

	//store number of existing items
	var num_existing_lis=menu_lis.length;

	//if menu_position is less than or equal to the current number of items, we use the "insertBefore" method. If not we use the the appendChild method.
	if(menu_position<=num_existing_lis)
	{
		//this is the reference node that we will insert the new element after
		var ref_node=menu_lis[menu_position-1];
		menu_ul.insertBefore(new_li, ref_node);
	}
	else
	{
		menu_ul.appendChild(new_li);
	}
}