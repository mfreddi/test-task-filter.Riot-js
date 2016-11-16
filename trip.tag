<trip>
  Выбрать компанию: <select class="list" name="list" onchange="{ changeCarrier }">
    <option>Все авиакомании</option>
    <option each="{ key, v in selectList }">{ key }</option>
  </select>
  <ul>
    <li each="{ filterList }">
      <b>Откуда:</b> { direction.from } - ­ <b>Куда:</b> { direction.to } <br>
      <b><b>Время вылета:</b> { formatDate(departure) } <br>
      <b>время прилета:</b> { formatDate(arrival) } <br>
      <b>Название авиакомпании:</b> { carrier } <br>
    </li>
  </ul>
  <script>
    this.selectList = {};
    this.filterList=[];
    this.flights = [];
    formatDate(date){
      var d = new Date(date);
      return d.toLocaleDateString("ru-RU") + ', ' + d.toLocaleTimeString("ru-RU");
    }
    getRequest('GET', 'data.json', data => {
      if(!data.error){
        this.flights = data.flights;
        data.flights.map(this.setSelectList);
        this.update({ selectList: this.selectList });
        this.update({ filterList: data.flights });
      } else {
        console.log(data);
      }
    });
    changeCarrier(e){
      var self = this;
      var listUpd = this.flights.filter(self.getFilterList(e.target.value));
      this.update({ filterList: listUpd });
    }
    getFilterList(val){
      return function(obj){
        return obj.carrier === val
      }
    }
    setSelectList(obj){
      this.selectList[obj.carrier] = 1;
    }
  </script>
</trip>
