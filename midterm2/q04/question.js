//Given this JavaScript code:

var employment = { 
  salary: 100,
  bonus: function() {
    this.salary *= 1.2;
  }  
}

class Person {}

const jill = new Person();
const jack = new Person();

Object.setPrototypeOf(jill, employment);
Object.setPrototypeOf(jack, employment);

console.log(Object.getPrototypeOf(jill) === Object.getPrototypeOf(jack)); // true

console.log(jill.salary); // 100
console.log(jack.salary); // 100

jill.bonus();

console.log(jill.salary); // 120
console.log(jack.salary); // 100

//The first console.log shows that both the objects, jill and jack,
//share the prototype. The values for salary for each are the same as well,
//initially. But, when the bonus function sets the salary, it changed only for
//the object jill and not for the object jack. Why is that? Explain.

/*
In JavaScript, when a prototype object is shared between instances, any properties that are directly accessed or modified on the prototype affect the shared state. However, when an instance explicitly accesses or modifies a property, the property is shadowed on the instance itself without altering the prototype. In the given code, the salary property is initially accessed from the shared prototype by both jill and jack, so it prints out 100 for both.

When the bonus function is called on jill, it modifies the salary on the ‘this’ object, which refers to jill. This creates a local salary property on the instance for jill, shadowing the salary property on the prototype. The object for jack continues to access the shared salary property from the prototype, which remains unchanged (100). This behavior demonstrates how JavaScript’s prototypal inheritance allows instances to override prototype properties independently.
*/

Total[10]: 10
