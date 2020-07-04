  function addToCart(a){
    var x = document.getElementById('btnAddtoCart'+a);
	var y = document.getElementById(a).value;
	var quantity= document.getElementById('quantity'+a).value;
    x.setAttribute('href', 'cart/addToCart?choco_id='+y+'&quantity='+quantity);
   }
function btnDownClick(a)
{
	var x = document.getElementById('quan'+a).value;
	var y = document.getElementById('choco_id'+a).value;
	if(x>1)
		x--;
	else
	x=1;
	document.getElementById('quan'+a).value=x;
		var z = document.getElementById('btnDown'+a);
		z.setAttribute('href', 'updateCart?choco_id='+y+'&quantity='+x);
}
function btnUpClick(a)
{
	var x = document.getElementById('quan'+a).value;
	var y = document.getElementById('choco_id'+a).value;
	x++;
	document.getElementById('quan'+a).value=x;
		var z = document.getElementById('btnUp'+a);
		z.setAttribute('href', 'updateCart?choco_id='+y+'&quantity='+x);
}
function btnRemoveClick(a){
  	if(confirm("Bạn có chắc chắn muốn xóa!","Thông báo"))
    {
  	  var x = document.getElementById('btnRemove'+a);
  	  var y = document.getElementById('choco_id'+a).value;
  	  x.setAttribute('href', 'removeCart?choco_id='+y);
    }
}
 function checkout(){
    var x = document.getElementById('btnCheckout');
	var y = document.getElementById('choco_id').value;
    x.setAttribute('href', 'checkout?product_id='+y);
   }