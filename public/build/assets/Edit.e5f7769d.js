import{u as b,a as c,c as _,w as o,b as v,o as S,d as e,V as C,e as $,f as n,g as i,h as k,i as y,j as w,l as m,k as l,n as L,p as T}from"./app.75fe97d5.js";import{r as U}from"./rules.e0338894.js";import N from"./SettingsDrawerContent.cecda05b.js";import{V as j}from"./VRow.1decdef7.js";import{V as A}from"./VCol.73001860.js";import{V as B}from"./VForm.36860c1c.js";import{V as d}from"./VSwitch.6870d19e.js";import{V as E}from"./VContainer.5696422c.js";import"./VSelect.0dade002.js";import"./VCheckboxBtn.47b8d0ed.js";import"./VSelectionControl.7a610615.js";import"./VChip.d1149a3f.js";/* empty css              */const K={__name:"Edit",props:{language:{type:Object,required:!0}},setup(g){const u=g,p=b(),a=c({_method:"PUT",name:u.language.name,code:u.language.code,is_active:!!u.language.is_active,is_default:!!u.language.is_default});function f(){a.post(route("admin.settings.languages.update",{language:u.language.id}),{onSuccess:t=>{t.props.flash.error&&p.showNotification(t)}})}return(t,s)=>{const V=v("AppLayout");return S(),_(V,{title:t.$t("Edit Language"),back:t.route("admin.settings.languages.index")},{"sub-navbar":o(()=>[e(N)]),default:o(()=>[e(E,null,{default:o(()=>[e(j,{justify:"center"},{default:o(()=>[e(A,{cols:"12",sm:"6"},{default:o(()=>[e(C,null,{default:o(()=>[e($,null,{default:o(()=>[n(i(t.$t("Edit Language")),1)]),_:1}),e(k,null,{default:o(()=>[n(i(t.$t("Here you can edit language information")),1)]),_:1}),e(y,null,{default:o(()=>[e(B,{onSubmit:w(f,["prevent"])},{default:o(()=>[e(m,{modelValue:l(a).name,"onUpdate:modelValue":s[0]||(s[0]=r=>l(a).name=r),class:"mb-5",label:t.$t("Language Name"),"error-messages":l(a).errors.name,rules:[l(U).required]},null,8,["modelValue","label","error-messages","rules"]),e(m,{modelValue:l(a).code,"onUpdate:modelValue":s[1]||(s[1]=r=>l(a).code=r),class:"mb-5",label:t.$t("Language Code"),disabled:""},null,8,["modelValue","label"]),e(d,{modelValue:l(a).is_active,"onUpdate:modelValue":s[2]||(s[2]=r=>l(a).is_active=r),class:"mb-5",label:t.$t("Active"),"error-messages":l(a).errors.is_active},null,8,["modelValue","label","error-messages"]),e(d,{modelValue:l(a).is_default,"onUpdate:modelValue":s[3]||(s[3]=r=>l(a).is_default=r),class:"mb-5",label:t.$t("Default"),"error-messages":l(a).errors.is_default},null,8,["modelValue","label","error-messages"]),e(L,{type:"submit",loading:l(a).processing},{default:o(()=>[e(T,{icon:"mdi-content-save"}),n(" "+i(t.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{K as default};