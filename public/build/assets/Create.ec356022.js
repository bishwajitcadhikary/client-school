import{a as _,c as d,w as o,b as k,o as n,d as a,V as S,e as v,f as i,g as V,j as $,i as y,k as l,l as p,aT as A,aU as C,m as U}from"./app.024f86d4.js";import c from"./SettingsDrawerContent.adb5afcc.js";import{V as D}from"./VForm.2f49ab8c.js";import{V as u}from"./VCol.19781618.js";import{V as m}from"./VTextField.4f31bb4a.js";import{V as N}from"./VSelect.2b406d4f.js";import{V as T}from"./VSwitch.bae126a7.js";import{V as W}from"./VContainer.066e5020.js";import"./VCheckboxBtn.26820d3d.js";import"./VSelectionControl.e3763b2e.js";import"./VCounter.2419f175.js";import"./form.51b8e79f.js";/* empty css              */const O={__name:"Create",props:{local_root:{type:String,default:null}},setup(f){const e=_({name:null,driver:"local",set_as_default:!1,local_root:f.local_root,aws_root:null,aws_key:null,aws_secret:null,aws_region:null,aws_bucket:null}),b=[{title:"Local",value:"local"},{title:"Amazon S3",value:"s3"}];function g(){e.post(route("admin.settings.file-disks.store"))}return(t,r)=>{const w=k("AppLayout");return n(),d(w,{title:t.$t("Add New Disk"),back:t.route("admin.settings.file-disks.index")},{"sub-navbar":o(()=>[a(c)]),default:o(()=>[a(W,null,{default:o(()=>[a(S,null,{default:o(()=>[a(v,null,{default:o(()=>[i(V(t.$t("Add New Disk")),1)]),_:1}),a(D,{onSubmit:$(g,["prevent"])},{default:o(()=>[a(y,null,{default:o(()=>[a(u,{cols:"12"},{default:o(()=>[a(m,{modelValue:l(e).name,"onUpdate:modelValue":r[0]||(r[0]=s=>l(e).name=s),label:t.$t("Name"),"error-messages":l(e).errors.name},null,8,["modelValue","label","error-messages"])]),_:1}),a(u,{cols:"12"},{default:o(()=>[a(N,{modelValue:l(e).driver,"onUpdate:modelValue":r[1]||(r[1]=s=>l(e).driver=s),label:t.$t("Driver"),items:b,"error-messages":l(e).errors.driver},null,8,["modelValue","label","error-messages"])]),_:1}),l(e).driver==="local"?(n(),d(u,{key:0,cols:"12"},{default:o(()=>[a(m,{modelValue:l(e).local_root,"onUpdate:modelValue":r[2]||(r[2]=s=>l(e).local_root=s),label:t.$t("Local Root"),"error-messages":l(e).errors.local_root},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),l(e).driver==="s3"?(n(),d(u,{key:1,cols:"12"},{default:o(()=>[a(m,{modelValue:l(e).aws_root,"onUpdate:modelValue":r[3]||(r[3]=s=>l(e).aws_root=s),class:"mb-5",label:t.$t("AWS Root"),"error-messages":l(e).errors.aws_root},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_key,"onUpdate:modelValue":r[4]||(r[4]=s=>l(e).aws_key=s),class:"mb-5",label:t.$t("AWS Driver"),"error-messages":l(e).errors.aws_key},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_secret,"onUpdate:modelValue":r[5]||(r[5]=s=>l(e).aws_secret=s),class:"mb-5",label:t.$t("AWS Secret"),"error-messages":l(e).errors.aws_secret},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_region,"onUpdate:modelValue":r[6]||(r[6]=s=>l(e).aws_region=s),class:"mb-5",label:t.$t("AWS Region"),"error-messages":l(e).errors.aws_region},null,8,["modelValue","label","error-messages"]),a(m,{modelValue:l(e).aws_bucket,"onUpdate:modelValue":r[7]||(r[7]=s=>l(e).aws_bucket=s),class:"mb-5",label:t.$t("AWS Bucket"),"error-messages":l(e).errors.aws_bucket},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),a(u,{cols:"12"},{default:o(()=>[a(T,{modelValue:l(e).set_as_default,"onUpdate:modelValue":r[8]||(r[8]=s=>l(e).set_as_default=s),label:t.$t("Is Default"),"error-messages":l(e).errors.set_as_default},null,8,["modelValue","label","error-messages"])]),_:1})]),_:1}),a(A,null,{default:o(()=>[a(C),a(U,{type:"submit",loading:l(e).processing},{default:o(()=>[i(V(t.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{O as default};
