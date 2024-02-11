var i;
for(i=0;i<=768;i+=32){
    instance_create(i,0,block)
    instance_create(i,576,block)
}
for(i=32;i<=544;i+=32){
    instance_create(0,i,block)
    instance_create(768,i,block)
}
