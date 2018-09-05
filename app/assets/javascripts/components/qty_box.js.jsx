
(function() {
  QuantityBox = class QuantityBox extends React.Component {
   
    constructor(props) {
        super();   
         this.state = {
            qty: 0,
            subtotal: 0
        };
    }

    onDecrement(e) {
      if (this.state.qty <= 0) return;
      // var tot = document.getElementById("total").innerHTML;
      // document.getElementById("total").innerHTML =  parseInt(tot) - parseInt(this.props.price);
      var tot = $("#order_total").val();
      $("#order_total").val(parseInt(tot) - parseInt(this.props.price));
      this.setState({qty: --this.state.qty, subtotal: this.state.qty * this.props.price});
    }

    onIncrement(e) {
     // var tot = document.getElementById("total").innerHTML;
     // document.getElementById("total").innerHTML =  parseInt(this.props.price) + parseInt(tot);
     var tot = $("#order_total").val();
     $("#order_total").val(parseInt(this.props.price) + parseInt(tot));
     this.setState({qty: ++this.state.qty, subtotal: this.state.qty * this.props.price}); 
    }   
  
    render() {
      return (
        <div className="qty-box">
          <span className="dec" onClick={this.onDecrement.bind(this)} onTouchStart={this.onDecrement}>–</span>
          <span className="">{this.state.qty}</span>
          <span className="inc" onClick={this.onIncrement.bind(this)} onTouchStart={this.onIncrement}>+</span>
          <span className="">${this.state.subtotal}</span>
          
        </div>

      );
    }
 };

 }());
