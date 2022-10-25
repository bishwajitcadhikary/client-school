import{ax as _,a as d,w as o,r as k,o as n,b as a,p as i,t as V,ay as S,az as u,u as l,e as p,f as v,g as $,aA as y}from"./app.886b2409.js";import A from"./SettingsDrawerContent.58f302a6.js";import{a as C,c as U,V as c,e as D}from"./VCard.1fa31838.js";import{V as N}from"./VForm.d0c83518.js";import{V as m}from"./VCol.1c30f3c9.js";import{V as W}from"./VSelect.ee306cd6.js";import{V as B}from"./VSwitch.67b957c8.js";import"./VCheckboxBtn.f6579222.js";import"./VSelectionControl.137abeee.js";import"./VChip.f7426b5f.js";const H={__name:"Create",props:{local_root:{type:String,default:null}},setup(b){const e=_({name:null,driver:"local",set_as_default:!1,local_root:b.local_root,aws_root:null,aws_key:null,aws_secret:null,aws_region:null,aws_bucket:null}),f=[{title:"Local",value:"local"},{title:"Amazon S3",value:"s3"}];function g(){e.post(route("admin.settings.file-disks.store"))}return(t,s)=>{const w=k("AdminLayout");return n(),d(w,{title:t.$t("Add New Disk"),back:t.route("admin.settings.file-disks.index")},{"sub-navbar":o(()=>[a(A)]),default:o(()=>[a(y,null,{default:o(()=>[a(C,null,{default:o(()=>[a(U,null,{default:o(()=>[i(V(t.$t("Add New Disk")),1)]),_:1}),a(N,{onSubmit:S(g,["prevent"])},{default:o(()=>[a(c,null,{default:o(()=>[a(m,{cols:"12"},{default:o(()=>[a(u,{modelValue:l(e).name,"onUpdate:modelValue":s[0]||(s[0]=r=>l(e).name=r),label:t.$t("Name"),"error-messages":l(e).errors.name},null,8,["modelValue","label","error-messages"])]),_:1}),a(m,{cols:"12"},{default:o(()=>[a(W,{modelValue:l(e).driver,"onUpdate:modelValue":s[1]||(s[1]=r=>l(e).driver=r),label:t.$t("Driver"),items:f,"error-messages":l(e).errors.driver},null,8,["modelValue","label","error-messages"])]),_:1}),l(e).driver==="local"?(n(),d(m,{key:0,cols:"12"},{default:o(()=>[a(u,{modelValue:l(e).local_root,"onUpdate:modelValue":s[2]||(s[2]=r=>l(e).local_root=r),label:t.$t("Local Root"),"error-messages":l(e).errors.local_root},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),l(e).driver==="s3"?(n(),d(m,{key:1,cols:"12"},{default:o(()=>[a(u,{modelValue:l(e).aws_root,"onUpdate:modelValue":s[3]||(s[3]=r=>l(e).aws_root=r),class:"mb-5",label:t.$t("AWS Root"),"error-messages":l(e).errors.aws_root},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_key,"onUpdate:modelValue":s[4]||(s[4]=r=>l(e).aws_key=r),class:"mb-5",label:t.$t("AWS Driver"),"error-messages":l(e).errors.aws_key},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_secret,"onUpdate:modelValue":s[5]||(s[5]=r=>l(e).aws_secret=r),class:"mb-5",label:t.$t("AWS Secret"),"error-messages":l(e).errors.aws_secret},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_region,"onUpdate:modelValue":s[6]||(s[6]=r=>l(e).aws_region=r),class:"mb-5",label:t.$t("AWS Region"),"error-messages":l(e).errors.aws_region},null,8,["modelValue","label","error-messages"]),a(u,{modelValue:l(e).aws_bucket,"onUpdate:modelValue":s[7]||(s[7]=r=>l(e).aws_bucket=r),class:"mb-5",label:t.$t("AWS Bucket"),"error-messages":l(e).errors.aws_bucket},null,8,["modelValue","label","error-messages"])]),_:1})):p("",!0),a(m,{cols:"12"},{default:o(()=>[a(B,{modelValue:l(e).set_as_default,"onUpdate:modelValue":s[8]||(s[8]=r=>l(e).set_as_default=r),label:t.$t("Is Default"),"error-messages":l(e).errors.set_as_default},null,8,["modelValue","label","error-messages"])]),_:1})]),_:1}),a(D,null,{default:o(()=>[a(v),a($,{type:"submit",loading:l(e).processing},{default:o(()=>[i(V(t.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{H as default};