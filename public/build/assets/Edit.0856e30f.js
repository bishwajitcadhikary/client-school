import{u as b,a as c,c as _,w as s,b as v,o as S,d as e,V as C,e as $,f as n,g as i,h as k,i as y,j as w,l as m,k as l,n as L,p as T}from"./app.fc5e7aab.js";import{r as U}from"./rules.750b13a8.js";import N from"./SettingsDrawerContent.41930670.js";import{V as j}from"./VRow.0c101af0.js";import{V as A}from"./VCol.48b6b065.js";import{V as B}from"./VForm.c3f8aaed.js";import{V as d}from"./VSwitch.24a1b15c.js";import{V as E}from"./VContainer.88b2197d.js";import"./VSelect.9d034a32.js";import"./VCheckboxBtn.b3459cab.js";import"./VSelectionControl.ef57def4.js";/* empty css              */const K={__name:"Edit",props:{language:{type:Object,required:!0}},setup(g){const u=g,p=b(),a=c({_method:"PUT",name:u.language.name,code:u.language.code,is_active:!!u.language.is_active,is_default:!!u.language.is_default});function f(){a.post(route("admin.settings.languages.update",{language:u.language.id}),{onSuccess:t=>{p.showNotification(t)}})}return(t,o)=>{const V=v("AppLayout");return S(),_(V,{title:t.$t("Edit Language"),back:t.route("admin.settings.languages.index")},{"sub-navbar":s(()=>[e(N)]),default:s(()=>[e(E,null,{default:s(()=>[e(j,{justify:"center"},{default:s(()=>[e(A,{cols:"12",sm:"6"},{default:s(()=>[e(C,null,{default:s(()=>[e($,null,{default:s(()=>[n(i(t.$t("Edit Language")),1)]),_:1}),e(k,null,{default:s(()=>[n(i(t.$t("Here you can edit language information")),1)]),_:1}),e(y,null,{default:s(()=>[e(B,{onSubmit:w(f,["prevent"])},{default:s(()=>[e(m,{modelValue:l(a).name,"onUpdate:modelValue":o[0]||(o[0]=r=>l(a).name=r),class:"mb-5",label:t.$t("Language Name"),"error-messages":l(a).errors.name,rules:[l(U).required]},null,8,["modelValue","label","error-messages","rules"]),e(m,{modelValue:l(a).code,"onUpdate:modelValue":o[1]||(o[1]=r=>l(a).code=r),class:"mb-5",label:t.$t("Language Code"),disabled:""},null,8,["modelValue","label"]),e(d,{modelValue:l(a).is_active,"onUpdate:modelValue":o[2]||(o[2]=r=>l(a).is_active=r),class:"mb-5",label:t.$t("Active"),"error-messages":l(a).errors.is_active},null,8,["modelValue","label","error-messages"]),e(d,{modelValue:l(a).is_default,"onUpdate:modelValue":o[3]||(o[3]=r=>l(a).is_default=r),class:"mb-5",label:t.$t("Default"),"error-messages":l(a).errors.is_default},null,8,["modelValue","label","error-messages"]),e(L,{type:"submit",loading:l(a).processing},{default:s(()=>[e(T,{icon:"mdi-content-save"}),n(" "+i(t.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{K as default};
