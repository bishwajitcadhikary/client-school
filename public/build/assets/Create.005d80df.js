import{a as _,c as d,w as o,b as k,o as n,d as a,V as S,e as v,f as i,g as V,j as $,i as y,l as u,k as l,m as p,aB as A,aC as C,n as U}from"./app.ddbcd361.js";import c from"./SettingsDrawerContent.72b87487.js";import{V as D}from"./VForm.9498a12f.js";import{V as m}from"./VCol.76f4a4a4.js";import{V as N}from"./VSelect.f189a344.js";import{V as B}from"./VSwitch.289647fb.js";import{V as W}from"./VContainer.bd2dfb17.js";import"./VCheckboxBtn.53f4c80f.js";import"./VSelectionControl.9ab4dc5a.js";/* empty css              */const H={__name:"Create",props:{local_root:{type:String,default:null}},setup(b){const e=_({name:null,driver:"local",set_as_default:!1,local_root:b.local_root,aws_root:null,aws_key:null,aws_secret:null,aws_region:null,aws_bucket:null}),f=[{title:"Local",value:"local"},{title:"Amazon S3",value:"s3"}];function g(){e.post(route("admin.settings.file-disks.store"))}return(t,s)=>{const w=k("AppLayout");return n(),d(w,{title:t.$t("Add New Disk"),back:t.route("admin.settings.file-disks.index")},{"sub-navbar":o(()=>[a(c)]),default:o(()=>[a(W,null,{default:o(()=>[a(S,null,{default:o(()=>[a(v,null,{default:o(()=>[i(V(t.$t("Add New Disk")),1)]),_:1}),a(D,{onSubmit:$(g,["prevent"])},{default:o(()=>[a(y,null,{default:o(()=>[a(m,{cols:"12"},{default:o(()=>[a(u,{modelValue:l(e).name,"onUpdate:modelValue":s[0]||(s[0]=r=>l(e).name=r),label:t.$t("Name"),"error-messages":l(e).errors.name},null,8,["modelValue","label","error-messages"])]),_:1}),a(m,{cols:"12"},{default:o(()=>[a(N,{modelValue:l(e).driver,"onUpdate:modelValue":s[1]||(s[1]=r=>l(e).driver=r),label:t.$t("Driver"),items:f,"error-messages":l(e).errors.driver},null,8,["modelValue","label","error-messages"])]),_:1}),l(e).driver==="local"?(n(),d(m,{key:0,cols:"12"},{default:o(()=>[a(u,{modelValue:l(e).local_root,"onUpdate:modelValue":s[2]||(s[2]=r=>l(e).local_root=r),label:t.$t("Local Root"),"error-messages":l(e).errors.local_root},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),l(e).driver==="s3"?(n(),d(m,{key:1,cols:"12"},{default:o(()=>[a(u,{modelValue:l(e).aws_root,"onUpdate:modelValue":s[3]||(s[3]=r=>l(e).aws_root=r),class:"mb-5",label:t.$t("AWS Root"),"error-messages":l(e).errors.aws_root},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_key,"onUpdate:modelValue":s[4]||(s[4]=r=>l(e).aws_key=r),class:"mb-5",label:t.$t("AWS Driver"),"error-messages":l(e).errors.aws_key},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_secret,"onUpdate:modelValue":s[5]||(s[5]=r=>l(e).aws_secret=r),class:"mb-5",label:t.$t("AWS Secret"),"error-messages":l(e).errors.aws_secret},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_region,"onUpdate:modelValue":s[6]||(s[6]=r=>l(e).aws_region=r),class:"mb-5",label:t.$t("AWS Region"),"error-messages":l(e).errors.aws_region},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_bucket,"onUpdate:modelValue":s[7]||(s[7]=r=>l(e).aws_bucket=r),class:"mb-5",label:t.$t("AWS Bucket"),"error-messages":l(e).errors.aws_bucket},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),a(m,{cols:"12"},{default:o(()=>[a(B,{modelValue:l(e).set_as_default,"onUpdate:modelValue":s[8]||(s[8]=r=>l(e).set_as_default=r),label:t.$t("Is Default"),"error-messages":l(e).errors.set_as_default},null,8,["modelValue","label","error-messages"])]),_:1})]),_:1}),a(A,null,{default:o(()=>[a(C),a(U,{type:"submit",loading:l(e).processing},{default:o(()=>[i(V(t.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{H as default};