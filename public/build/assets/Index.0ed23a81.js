import m from"./AccountSettingsAccount.613190ec.js";import d from"./AccountSettingsSecurity.39671791.js";import{a as p,V as f,c as n,b as y}from"./VWindowItem.100ab068.js";import{r as b,c as V,w as r,b as g,o as u,d as e,aa as v,ab as A,p as w,f as q,g as T,M as j,ax as k}from"./app.bbada7ee.js";import"./rules.217e6c0b.js";import"./filepond-plugin-image-preview.min.6ccf6abb.js";import"./VRow.3d8628ae.js";/* empty css              */import"./VForm.a9a30d19.js";import"./VCol.0ac1e7d0.js";import"./VSelect.d2b0837d.js";import"./VCheckboxBtn.f552187c.js";import"./VSelectionControl.082103a1.js";import"./VAlert.73a15395.js";import"./VCheckbox.fcb3898f.js";const W={__name:"Index",props:{customer:{type:Object,required:!0},languages:{type:[Array,Object],required:!0},countries:{type:[Array,Object],required:!0},currencies:{type:[Array,Object],required:!0},timeZones:{type:[Array,Object],required:!0},confirmsTwoFactorAuthentication:{type:Boolean,default:null},sessions:{type:Array,default:null}},setup(a){const o=b(null),s=[{title:"Account",icon:"mdi-account-outline",tab:"account"},{title:"Security",icon:"mdi-lock-open-outline",tab:"security"}];return(l,i)=>{const c=g("AppLayout");return u(),V(c,{title:l.$t("Profile")},{default:r(()=>[e(f,{modelValue:o.value,"onUpdate:modelValue":i[0]||(i[0]=t=>o.value=t),"show-arrows":""},{default:r(()=>[(u(),v(j,null,A(s,t=>e(p,{key:t.icon,value:t.tab},{default:r(()=>[e(w,{size:"20",start:"",icon:t.icon},null,8,["icon"]),q(" "+T(t.title),1)]),_:2},1032,["value"])),64))]),_:1},8,["modelValue"]),e(k),e(y,{modelValue:o.value,"onUpdate:modelValue":i[1]||(i[1]=t=>o.value=t),class:"mt-5 disable-tab-transition",touch:!1},{default:r(()=>[e(n,{value:"account"},{default:r(()=>[e(m,{customer:a.customer,languages:a.languages,countries:a.countries,currencies:a.currencies,"time-zones":a.timeZones,"requires-confirmation":a.confirmsTwoFactorAuthentication},null,8,["customer","languages","countries","currencies","time-zones","requires-confirmation"])]),_:1}),e(n,{value:"security"},{default:r(()=>[e(d)]),_:1})]),_:1},8,["modelValue"])]),_:1},8,["title"])}}};export{W as default};