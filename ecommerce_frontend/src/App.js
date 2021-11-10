import './App.css';
import React, { useEffect, useState } from "react";
import Cookies from 'js-cookie';

function App() {

  const [categories, setCategories] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [products, setProducts] = useState([]);
  const [cartItems, setCartItems] = useState([]);
  const [sessionId, setSessionId] = useState(new Date().getTime());

  useEffect(() => {
    loadCartItems();
    loadCategories();
  }, []);

  function loadCategories() {
    fetch('http://192.168.0.87:8080/categories/',
      { headers: { 'AppSession': sessionId } })
      .then(response => response.json()).then(data => {
        setCategories(data);
        console.log(data);
        if (selectedCategory === null) {
          selectCategory(data[0]);
        }
      });
  }

  function selectCategory(category) {
    setSelectedCategory(category);
    loadProducts(category);
  }

  function loadCartItems() {
    setCartItems([]);
    fetch('http://192.168.0.87:8080/cart/items',
      { headers: { 'AppSession': sessionId } })
      .then(response => response.json()).then(data => {
        setCartItems(data);
        console.log(data);
      });
  }

  function loadProducts(category) {
    fetch('http://192.168.0.87:8080/products/bycategory/' + category.id,
      { headers: { 'AppSession': sessionId } })
      .then(response => response.json()).then(data => {
        setProducts(data);
        console.log(data);
      });
  }

  function addToCart(product) {
    fetch('http://192.168.0.87:8080/cart/', {
      method: 'POST',
      headers: {
        'AppSession': sessionId,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ productId: product.id, quantity: 1 })
    }).then(response => response.json()).then(data => {
      loadCartItems();
    });
  }

  function placeOrder() {
    fetch('http://192.168.0.87:8080/cart/submit/', {
      method: 'POST',
      headers: {
        'AppSession': sessionId,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ sessionId: sessionId })
    }).then(response => response.json()).then(data => {
      alert('Order placed successfully');
      window.location.reload();
    });
  }

  return (
    <div className="App">
      <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">E Commerce</a>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav">
          <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="#">Cart ({cartItems.length})</a>
          </div>
        </div>
      </header>
      <div class="container-fluid">
        <div class="row">
          <nav id="sidebarMenu" class="col-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
              <ul class="nav flex-column">

                {categories.map((category, index) =>
                  <li class="nav-item" key={index}>
                    <a class="nav-link active text-capitalize" aria-current="page" href="#" onClick={() => selectCategory(category)}>
                      {category.name}
                    </a>
                  </li>
                )}

              </ul>
            </div>
          </nav>
          <main class="col">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
              {selectedCategory != null &&
                <h1 class="h2 text-uppercase">{selectedCategory.name}</h1>
              }
            </div>
            <div class="row">
              <div class="col-md-12">
                {products.map((product, index) =>
                  <div class="card" style={{ width: "18rem" }}>
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">{product.name.toUpperCase()}</text></svg>
                    <div class="card-body">
                      <h5 class="card-title text-capitalize">{product.name}</h5>
                      <p class="card-text text-capitalize">{product.description}</p>
                      <a href="#" class="btn btn-primary" onClick={() => addToCart(product)}>Add to Cart</a>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </main>
          {cartItems.length > 0 &&
            <div class="col-3">
              <div class="card w-100 my-2 mx-2  ">
                <div class="card-body">
                  <h5 class="card-title">Cart</h5>
                  <ul class="list-group list-group-flush">
                    {cartItems.map((item, index) =>
                      <li class="list-group-item">
                        <div class="d-flex w-100 justify-content-between">
                          <h5 class="mb-1 text-capitalize">{item.productName}</h5>
                          <small>x{item.quantity} </small>
                          <amount>INR {item.amount.toFixed(2)}/-</amount>
                        </div>
                      </li>
                    )}
                    <li class="list-group-item fw-bold">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1 text-capitalize">Total</h5>
                        <small>-</small>
                        <amount>INR {cartItems.reduce((totalValue, currentValue) => {
                          return totalValue + currentValue.amount
                        }, 0).toFixed(2)}/-</amount>
                      </div>
                    </li>
                    <li class="list-group-item">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1 text-capitalize">Payment Mode</h5>
                        <small>-</small>
                        <amount>Cash on Delivery</amount>
                      </div>
                    </li>
                    <li class="list-group-item">
                      <div class="d-flex w-100 justify-content-between">
                        <button class="btn btn-primary btn-block w-100" onClick={() => { placeOrder() }}>Place Order</button>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          }
        </div>
      </div>
    </div>
  );
}

export default App;
