function topage(page)
{
	var form = document.forms[0];
	form.page.value = page;
	form.submit();
}