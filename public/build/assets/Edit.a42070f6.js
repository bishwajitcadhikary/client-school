import{u as b,a as c,c as _,w as l,b as v,o as S,d as e,V as C,e as $,f as n,g as i,h as k,i as y,j as w,k as o,m as L,n as T}from"./app.c74c21f4.js";import{r as U}from"./rules.aed30137.js";import N from"./SettingsDrawerContent.4e2e494c.js";import{V as j}from"./VRow.51c37cbe.js";import{V as A}from"./VCol.fb68aa0d.js";import{V as B}from"./VForm.64f4569b.js";import{V as m}from"./VTextField.2cf6dc35.js";import{V as d}from"./VSwitch.c46a2151.js";import{V as E}from"./VContainer.9871394f.js";import"./VSelect.5810ae9c.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VCounter.bd549793.js";/* empty css              */const X={__name:"Edit",props:{language:{type:Object,required:!0}},setup(p){const u=p,g=b(),a=c({_method:"PUT",name:u.language.name,code:u.language.code,is_active:!!u.language.is_active,is_default:!!u.language.is_default});function f(){a.post(route("admin.settings.languages.update",{language:u.language.id}),{onSuccess:t=>{t.props.flash.error&&g.showNotification(t)}})}return(t,s)=>{const V=v("AppLayout");return S(),_(V,{title:t.$t("Edit Language"),back:t.route("admin.settings.languages.index")},{"sub-navbar":l(()=>[e(N)]),default:l(()=>[e(E,null,{default:l(()=>[e(j,{justify:"center"},{default:l(()=>[e(A,{cols:"12",sm:"6"},{default:l(()=>[e(C,null,{default:l(()=>[e($,null,{default:l(()=>[n(i(t.$t("Edit Language")),1)]),_:1}),e(k,null,{default:l(()=>[n(i(t.$t("Here you can edit language information")),1)]),_:1}),e(y,null,{default:l(()=>[e(B,{onSubmit:w(f,["prevent"])},{default:l(()=>[e(m,{modelValue:o(a).name,"onUpdate:modelValue":s[0]||(s[0]=r=>o(a).name=r),class:"mb-5",label:t.$t("Language Name"),"error-messages":o(a).errors.name,rules:[o(U).required]},null,8,["modelValue","label","error-messages","rules"]),e(m,{modelValue:o(a).code,"onUpdate:modelValue":s[1]||(s[1]=r=>o(a).code=r),class:"mb-5",label:t.$t("Language Code"),disabled:""},null,8,["modelValue","label"]),e(d,{modelValue:o(a).is_active,"onUpdate:modelValue":s[2]||(s[2]=r=>o(a).is_active=r),class:"mb-5",label:t.$t("Active"),"error-messages":o(a).errors.is_active},null,8,["modelValue","label","error-messages"]),e(d,{modelValue:o(a).is_default,"onUpdate:modelValue":s[3]||(s[3]=r=>o(a).is_default=r),class:"mb-5",label:t.$t("Default"),"error-messages":o(a).errors.is_default},null,8,["modelValue","label","error-messages"]),e(L,{type:"submit",loading:o(a).processing},{default:l(()=>[e(T,{icon:"mdi-content-save"}),n(" "+i(t.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{X as default};
