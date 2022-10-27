import{a as _,c as d,w as o,b as k,o as n,d as a,V as S,e as v,f as i,g as V,j as $,i as y,l as m,k as l,m as p,aP as A,aQ as C,n as U}from"./app.bb08e2ce.js";import c from"./SettingsDrawerContent.6e3284e9.js";import{V as D}from"./VForm.c256084f.js";import{V as u}from"./VCol.b330a76f.js";import{V as N}from"./VSelect.d3ab3368.js";import{V as W}from"./VSwitch.f974743d.js";import{V as B}from"./VContainer.6c0aeef1.js";import"./VCheckboxBtn.a6269670.js";import"./VSelectionControl.5dca4523.js";import"./VChip.7e261ff6.js";/* empty css              */const G={__name:"Create",props:{local_root:{type:String,default:null}},setup(b){const e=_({name:null,driver:"local",set_as_default:!1,local_root:b.local_root,aws_root:null,aws_key:null,aws_secret:null,aws_region:null,aws_bucket:null}),f=[{title:"Local",value:"local"},{title:"Amazon S3",value:"s3"}];function g(){e.post(route("admin.settings.file-disks.store"))}return(t,s)=>{const w=k("AdminLayout");return n(),d(w,{title:t.$t("Add New Disk"),back:t.route("admin.settings.file-disks.index")},{"sub-navbar":o(()=>[a(c)]),default:o(()=>[a(B,null,{default:o(()=>[a(S,null,{default:o(()=>[a(v,null,{default:o(()=>[i(V(t.$t("Add New Disk")),1)]),_:1}),a(D,{onSubmit:$(g,["prevent"])},{default:o(()=>[a(y,null,{default:o(()=>[a(u,{cols:"12"},{default:o(()=>[a(m,{modelValue:l(e).name,"onUpdate:modelValue":s[0]||(s[0]=r=>l(e).name=r),label:t.$t("Name"),"error-messages":l(e).errors.name},null,8,["modelValue","label","error-messages"])]),_:1}),a(u,{cols:"12"},{default:o(()=>[a(N,{modelValue:l(e).driver,"onUpdate:modelValue":s[1]||(s[1]=r=>l(e).driver=r),label:t.$t("Driver"),items:f,"error-messages":l(e).errors.driver},null,8,["modelValue","label","error-messages"])]),_:1}),l(e).driver==="local"?(n(),d(u,{key:0,cols:"12"},{default:o(()=>[a(m,{modelValue:l(e).local_root,"onUpdate:modelValue":s[2]||(s[2]=r=>l(e).local_root=r),label:t.$t("Local Root"),"error-messages":l(e).errors.local_root},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),l(e).driver==="s3"?(n(),d(u,{key:1,cols:"12"},{default:o(()=>[a(m,{modelValue:l(e).aws_root,"onUpdate:modelValue":s[3]||(s[3]=r=>l(e).aws_root=r),class:"mb-5",label:t.$t("AWS Root"),"error-messages":l(e).errors.aws_root},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_key,"onUpdate:modelValue":s[4]||(s[4]=r=>l(e).aws_key=r),class:"mb-5",label:t.$t("AWS Driver"),"error-messages":l(e).errors.aws_key},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_secret,"onUpdate:modelValue":s[5]||(s[5]=r=>l(e).aws_secret=r),class:"mb-5",label:t.$t("AWS Secret"),"error-messages":l(e).errors.aws_secret},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_region,"onUpdate:modelValue":s[6]||(s[6]=r=>l(e).aws_region=r),class:"mb-5",label:t.$t("AWS Region"),"error-messages":l(e).errors.aws_region},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_bucket,"onUpdate:modelValue":s[7]||(s[7]=r=>l(e).aws_bucket=r),class:"mb-5",label:t.$t("AWS Bucket"),"error-messages":l(e).errors.aws_bucket},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),a(u,{cols:"12"},{default:o(()=>[a(W,{modelValue:l(e).set_as_default,"onUpdate:modelValue":s[8]||(s[8]=r=>l(e).set_as_default=r),label:t.$t("Is Default"),"error-messages":l(e).errors.set_as_default},null,8,["modelValue","label","error-messages"])]),_:1})]),_:1}),a(A,null,{default:o(()=>[a(C),a(U,{type:"submit",loading:l(e).processing},{default:o(()=>[i(V(t.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{G as default};
