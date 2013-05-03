<%@ page language="java" pageEncoding="UTF-8"%> 
<html> 
<head>
<meta charset="utf-8">
<title>Tutorial: Hello Dojo!</title>
</head>
<script src="../js/dojo.js"></script>
<script>
dojo.addOnLoad(function() {
    dojo.create(
        "div",
        {
            "innerHTML": "Hello, World!"
        },
        dojo.body()
    );
    //dojo.place, dojo.empty, dojo.destroy
    
    dojo.byId("message").innerHTML;
    dojo.fadeIn({
        node: dojo.byId("message"),
        duration: 600
    }).play();
    dojo.query("#list li").forEach(function(item) {
        //console.log(item.innerHTML);
    });
    dojo.query(".highlight").style({
        backgroundColor: "yellow",
        color: "red"
    });
    
    var list = ['My','name','is','Joe'];
    dojo.forEach(list, function(item, i) {
        //console.log((i+1)+'. '+item);
    });
    //使用一个命名函数通过 dojo.forEach 遍历一个数组
    var printArray = function(item, i) {
        //console.log((i+1)+'. '+item);
    }
    dojo.forEach(list, printArray);
    dojo.indexOf(list, "name");
    dojo.lastIndexOf(list, "name");
    
    //过滤一个数组来创建一个新数组
    var filteredList = dojo.filter(list, function(item) {
        return item != "is";
    });
    dojo.forEach(filteredList, "console.log(item)");
    //dojo.map, dojo.some, dojo.every
    
    //使用 dojo.connect 附加函数到 DOM 事件
    var message = dojo.byId("message");
    dojo.connect(message, "onclick", function() {
        alert(message.innerHTML);
    });
    //附加事件到数组元素上
    dojo.query("#list li").forEach(function(item) {
        dojo.connect(item, "onclick", function() {
            dojo.style(item, {
                fontWeight: "bold"
            });
        });
    });
    dojo.query("#list li").onclick(function(e) { //e 参数是 Event 对象的一个引用，对象的 target 属性帮助您确定触发事件的元素。
        dojo.style(e.target, {
            color: "green"
        });
    });
    
    function toggleImage() {
        console.log("image...");
    }
    function callAjax() {
    	console.log("ajax...");
    }
    function handleResponse() {
    	console.log("resp...");
    }
    dojo.connect(callAjax, toggleImage);
    dojo.connect(handleResponse, toggleImage);
    
    //发布和订阅主题
    dojo.subscribe("printName", function(msg) {
        console.log("The person's name is: "+msg.first_name+" "+msg.last_name);
    });
    dojo.publish("printName", [
        {
            first_name: "Joe",
            last_name: "Lennon"
        }
    ]);
    
    //使用 dojo.xhr* 增强 Ajax
    //http://localhost:8888/start_j2ee/dojo/start.jsp
    dojo.xhrGet({
        url: "data.json",
        handleAs: "json",
        load: function(data) {
            var table = "<table border=\"1\"><tr><th>Name</th><th>Age</th></tr>";
            dojo.forEach(data.people, function(person) {
                table += "<tr><td>" + person.first_name+" "+person.last_name + "</td>";
                table += "<td>" + person.age + "</td>";
                table += "</tr>";
            });
            table += "</table>";
            dojo.place(table, dojo.body());
        }
    });
    
    //使用 Dojo 模拟基于类的 OOP
    dojo.declare("Car", null, {
        reg_no: "",
        current_speed: 0,
        current_gear: 0,
        constructor: function(reg_no) {
            this.reg_no = reg_no;
        },
        accelerate: function(increment) {
            this.current_speed += increment;
        },
        decelerate: function(decrement) {
            this.current_speed -= decrement;
        },
        increaseGear: function() {
            this.current_gear++;
        },
        decreaseGear: function() {
            this.current_gear--;
        }
    });
    var myCar = new Car("10C500");
    myCar.accelerate(30);
    myCar.accelerate(20);
    myCar.decelerate(5);
    console.log(myCar.reg_no+" travelling at "+myCar.current_speed+" mph");
    
    //继承,创建 ATCar 子类
    dojo.declare("ATCar", Car, {
        accelerate: function(increment) {
            this.inherited(arguments);
            if(increment >= 10) this.increaseGear();
        },
        decelerate: function(decrement) {
            this.inherited(arguments);
            if(decrement >= 10) this.decreaseGear();
        }
    });
    var myCar = new ATCar("10C500");
    myCar.accelerate(30);
    myCar.accelerate(20);
    myCar.decelerate(5);
    console.log(myCar.reg_no+" travelling at "+myCar.current_speed+" mph in gear "+myCar.current_gear);
    
    
    //Dojo 中的多继承性
    dojo.declare("Phone", null, {
        phone_number: "",
        minutes_remaining: 0,
        constructor: function(properties) {
            //this.phone_number = properties.phone_number;
            //this.minutes_remaining = properties.minutes_remaining;
            dojo.mixin(this, properties);
            console.log("Phone "+this.phone_number+" powered on. You have "+this.minutes_remaining+" minute(s) remaining.");
        }
    });

    dojo.declare("MediaPlayer", null, {
        disk_space: 0,
        songs:[],
        constructor: function(properties) {
            this.disk_space = properties.disk_space;
            this.songs = properties.songs;
            console.log("Media Player powered on. You have "+this.songs.length+" songs, with "+this.disk_space+" GB free space left.");
        }
    });

    dojo.declare("Smartphone", [Phone, MediaPlayer], {
        phone_id: "",
        constructor: function(properties) {
            this.phone_id = properties.phone_id;
            console.log("Smartphone ID "+this.phone_id+" boot up complete.");
        }
    });

    var songs = [
        {artist:"U2",title:"Vertigo"},
        {artist:"Coldplay",title:"Yellow"}
    ];

    var myPhone = new Smartphone({
        phone_number:"(555) 123-4567", 
        minutes_remaining: 60, 
        disk_space: 2.5, 
        songs: songs,
        phone_id: "4345FDFD7JAPO76"
    });

    console.log(myPhone);
    
    //使用 dojo.mixin 来改进多继承性示例
    var objA = { a: 1, b: 2 };
    var objB = { b: 3, c: 4 };
    dojo.mixin(objA, objB);
    console.log(objA);
});
</script>
<body>
<div id="message">This is a DIV element with id attribute message.</div>
<ul id="list">
    <li>This is the first item in a list</li>
    <li class="highlight">This is the second item in a list</li>
    <li>This is the third item in a list</li>
</ul>
</body>
</html>