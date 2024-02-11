var i;
for(i=-32;i<=800;i+=32){
    instance_create(i,-32,block)
    instance_create(i,608,block)
}
for(i=0;i<=576;i+=32){
    instance_create(-32,i,block)
    instance_create(800,i,block)
}
