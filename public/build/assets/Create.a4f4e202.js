import{u as g,a as y,c as _,w as o,b as $,o as S,d as r,V as v,e as C,f as d,g as i,h as c,i as w,j as U,k as e,m as k,n as q}from"./app.c74c21f4.js";import{r as m}from"./rules.aed30137.js";import A from"./SettingsDrawerContent.4e2e494c.js";import{V as T}from"./VForm.64f4569b.js";import{V as B}from"./VRow.51c37cbe.js";import{V as u}from"./VCol.fb68aa0d.js";import{V as n}from"./VTextField.2cf6dc35.js";import{V as p}from"./VSelect.5810ae9c.js";import{V}from"./VSwitch.c46a2151.js";import{V as L}from"./VContainer.9871394f.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VCounter.bd549793.js";/* empty css              */const X={__name:"Create",setup(D){g();const l=y({name:null,rate:null,code:null,precision:null,symbol:null,swap_currency_symbol:null,decimal_separator:null,thousand_separator:null,is_active:null,is_default:null});function b(){l.post(route("admin.settings.currencies.store"))}return(t,a)=>{const f=$("AppLayout");return S(),_(f,{back:t.route("admin.settings.languages.index"),title:t.$t("Create Language")},{"sub-navbar":o(()=>[r(A)]),default:o(()=>[r(L,null,{default:o(()=>[r(v,null,{default:o(()=>[r(C,null,{default:o(()=>[d(i(t.$t("Create Language")),1)]),_:1}),r(c,null,{default:o(()=>[d(i(t.$t("Here you can create new language")),1)]),_:1}),r(w,null,{default:o(()=>[r(T,{onSubmit:U(b,["prevent"])},{default:o(()=>[r(B,null,{default:o(()=>[r(u,{cols:"12",lg:"6"},{default:o(()=>[r(n,{modelValue:e(l).name,"onUpdate:modelValue":a[0]||(a[0]=s=>e(l).name=s),"error-messages":e(l).errors.name,label:t.$t("Name"),rules:[e(m).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(n,{modelValue:e(l).code,"onUpdate:modelValue":a[1]||(a[1]=s=>e(l).code=s),"error-messages":e(l).errors.code,label:t.$t("Code"),rules:[e(m).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(n,{modelValue:e(l).rate,"onUpdate:modelValue":a[2]||(a[2]=s=>e(l).rate=s),"error-messages":e(l).errors.rate,label:t.$t("Rate"),rules:[e(m).required],type:"number"},null,8,["modelValue","error-messages","label","rules"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(p,{modelValue:e(l).precision,"onUpdate:modelValue":a[3]||(a[3]=s=>e(l).precision=s),"error-messages":e(l).errors.precision,items:["0",1,2,3,4],label:t.$t("Precision"),rules:[e(m).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(n,{modelValue:e(l).symbol,"onUpdate:modelValue":a[4]||(a[4]=s=>e(l).symbol=s),"error-messages":e(l).errors.symbol,label:t.$t("Symbol"),rules:[e(m).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(p,{modelValue:e(l).swap_currency_symbol,"onUpdate:modelValue":a[5]||(a[5]=s=>e(l).swap_currency_symbol=s),"error-messages":e(l).errors.swap_currency_symbol,items:[{title:t.$t("After Amount"),value:!0},{title:t.$t("Before Amount"),value:!1}],label:t.$t("Symbol Position")},null,8,["modelValue","error-messages","items","label"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(n,{modelValue:e(l).decimal_separator,"onUpdate:modelValue":a[6]||(a[6]=s=>e(l).decimal_separator=s),"error-messages":e(l).errors.decimal_separator,label:t.$t("Decimal Separator"),rules:[e(m).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),r(u,{cols:"12",lg:"6"},{default:o(()=>[r(n,{modelValue:e(l).thousand_separator,"onUpdate:modelValue":a[7]||(a[7]=s=>e(l).thousand_separator=s),"error-messages":e(l).errors.thousand_separator,label:t.$t("Thousands Separator")},null,8,["modelValue","error-messages","label"])]),_:1})]),_:1}),r(u,{cols:"12"},{default:o(()=>[r(V,{modelValue:e(l).is_active,"onUpdate:modelValue":a[8]||(a[8]=s=>e(l).is_active=s),"error-messages":e(l).errors.is_active,label:t.$t("Active"),class:"mb-5"},null,8,["modelValue","error-messages","label"]),r(V,{modelValue:e(l).is_default,"onUpdate:modelValue":a[9]||(a[9]=s=>e(l).is_default=s),"error-messages":e(l).errors.is_default,label:t.$t("Default"),class:"mb-5"},null,8,["modelValue","error-messages","label"])]),_:1}),r(k,{loading:e(l).processing,type:"submit"},{default:o(()=>[r(q,{icon:"mdi-content-save"}),d(" "+i(t.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1},8,["back","title"])}}};export{X as default};
