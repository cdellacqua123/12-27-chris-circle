function Animal(name) {
    this.name = name;
};

Animal.prototype.eat = function () {
    console.log(this.name + ' is eating.');
};

function Cat(name, age) {
    this.name = name;
    this.age = age
}


function inherits(ParentClass, ChildClass) {
    function Surrogate() {};
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
    ChildClass.prototype.constructor = ChildClass;
}

Function.prototype.inherits = function (Parent) {
    function Surrogate() { };
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};

// inherits(Animal, Cat)
Cat.inherits(Animal)

Cat.prototype.meow = function () {
    console.log("meow");
};

const garfield = new Cat('Garfield', 30);
console.log(garfield)
garfield.eat();
garfield.meow();