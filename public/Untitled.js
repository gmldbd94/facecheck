function ready(fn) {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

ready(init);


function init(){

var w = window.innerWidth;
var h = window.innerHeight;
var r = 0;  //radius

var cW = w/8;
var cH = h/4;
if (cW >= cH){r=cH*3/5;}
else if (cW < cH){r=cW*3/5;}

  var svg = d3.select("body")
                .append("svg")
                .attr("class", "row")
                .attr("width",w)
                .attr("height",h);

var data = [
            {"name":"Steve Jobs","explain":"Apple", "color":"#81c684","img":"steve.png", "href":"stevejobs.html"},
            {"name":"Bill Gates","explain":"Microsoft", "color":"#69A8AA","img":"bill.png", "href":"billgates.html"},
            {"name":"Paul Gardner Allen","explain":"Microsoft", "color":"#5050FF","img":"paul.png", "href":"paul.html"},
            {"name":"Mark Elliot Zuckerberg","explain":"Facebook", "color":"#3C5898","img":"mark.png", "href":"mark.html"},
            {"name":"Ralph Lauren","explain":"Polo Ralph Lauren", "color":"#1E3269","img":"lauren.png", "href":"lauren.html"},
            {"name":"Michael Saul Dell","explain":"DELL", "color":"#46B8FF","img":"dell.png", "href":"dell.html"},
            {"name":"Amancio Ortega Gaona","explain":"ZARA", "color":"#dcdcdc","img":"amancio.png", "href":"amancio.html"},
            {"name":"Larry Ellison","explain":"Oracle", "color":"#B90000","img":"larry.png", "href":"oracle.html"}
          ];

                

    var g = svg.append("g")
                .attr("class", "Wrapper");

    var text_n = g.append("g")
            .attr("class","text");

    var text_c = g.append("g")
            .attr("class","text");

var text_name = text_n.selectAll("text")
                    .data(data)
                    .enter()
                    .append("text") 
                    .attr('class','text_n')
                    .style('font-size','15px')
                    .attr("text-anchor", "middle")
                    .attr('fill','black')
                    .attr('x',(d,i)=>{i=Math.floor(i%4); return ((2*i+1)*cW)})
                    .attr('y',(d,i)=>{i=Math.floor(i/4); return ((2*i+1)*cH)+r+r/5+r/8})
                    .text(d=>d.name);

                                       
var text_content = text_c.selectAll("text")
                        .data(data)
                        .enter()
                        .append("text")
                        .attr('class','text_C')
                        .style('font-size','10px')
                        .attr("text-anchor", "middle")
                        .attr('fill','black')
                        .attr('x',(d,i)=>{i=Math.floor(i%4); return ((2*i+1)*cW)})
                        .attr('y',(d,i)=>{i=Math.floor(i/4); return ((2*i+1)*cH)+r+r/2+r/6})
                        .text(d=>d.explain);
    
            
                    
      
      
    var circle= g.selectAll("circle")
                  .data(data)
                  .enter()
                  .append('circle')
                  .style("fill",(d,i)=>d.color)
                  .attr("r",r)
                  .attr('cx',(d,i)=>{i=Math.floor(i%4); return ((2*i+1)*cW)})
                  .attr('cy',(d,i)=>{i=Math.floor(i/4); return ((2*i+1)*cH)});

                  var image= g.append('g')
                              .attr('class','img');

                              var img = image.selectAll("#infoBox")
                                              .data(data)
                                              .enter()
                                              .append('svg:image')
                                              .attr('href',(d,i)=>d.img)
                                              .attr('width',3/2*r)
                                              .attr('height',3/2*r)
                                              .attr('x',(d,i)=>{i=Math.floor(i%4); return ((2*i+1)*cW)-r+r/4})
                                              .attr('y',(d,i)=>{i=Math.floor(i/4); return ((2*i+1)*cH)-r+r/5});
                                             
                              var url = g.selectAll('scatter-dot')
                                            .data(data)
                                            .enter()
                                            .append("a")
                                            .attr("xlink:href", function(d) {return d.href})
                                            .append("circle")
                                            .attr("r",r)
                                            .attr('cx',(d,i)=>{i=Math.floor(i%4); return ((2*i+1)*cW)})
                                            .attr('cy',(d,i)=>{i=Math.floor(i/4); return ((2*i+1)*cH)})
                                            .style('opacity',0);

                                
   
  
}//init