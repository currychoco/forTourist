function searchFestival(){
    let date = $("#date").val();
    
    console.log(typeof(date));
    let data = [];
    data = date.split('-');

    date = data[0] + data[1] + data[2];
    
    $.ajax({
       method:"GET",
       url:"http://apis.data.go.kr/B551011/KorService/searchFestival",
       data:{
           _type:'json',
           serviceKey:'l2oC21FGcJ1+nVdL+JFnI3VBpnvzf5lsgD57VDKIGm7hR6fr0+NtkS5i+qtBHo7zUtvUe1nhWVqg/Kc6dxa/Ow==',
           MobileOS:'ETC',
           MobileApp:'AppTest',
           eventStartDate: date
       }
   }).done(function(response){
       console.log("response : ", response);
       const items = response.response.body.items.item;
       console.log(items);
       items.forEach(e => {
   
           $('.container').append(
               `
                <tr>
                    <td>${e.title}</td>
                    <td>${e.addr1}</td>
                    <td>${e.tel}</td>
                    <td><img src="${e.firstimage}" width='100' height='200'></td>
                </tr>
                `
           );
       });
   });
}
 