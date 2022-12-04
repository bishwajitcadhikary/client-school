import{u as _,a as $,c as S,w as t,b as v,o as U,d as l,V as w,e as C,f as i,g as p,h as k,i as q,j as A,k as e,m as T,n as B}from"./app.c74c21f4.js";import{r as n}from"./rules.aed30137.js";import N from"./SettingsDrawerContent.4e2e494c.js";import{V as D}from"./VForm.64f4569b.js";import{V as E}from"./VRow.51c37cbe.js";import{V as m}from"./VCol.fb68aa0d.js";import{V as d}from"./VTextField.2cf6dc35.js";import{V as c}from"./VSelect.5810ae9c.js";import{V}from"./VSwitch.c46a2151.js";import{V as F}from"./VContainer.9871394f.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VCounter.bd549793.js";/* empty css              */const Z={__name:"Edit",props:{currency:{type:Object,required:!0,default:null}},setup(b){const u=b,f=_(),r=$({_method:"PUT",name:u.currency.name,rate:u.currency.rate,code:u.currency.code,precision:u.currency.precision,symbol:u.currency.symbol,swap_currency_symbol:!!u.currency.swap_currency_symbol,decimal_separator:u.currency.decimal_separator,thousand_separator:u.currency.thousand_separator,is_active:!!u.currency.is_active,is_default:!!u.currency.is_default});function y(){r.post(route("admin.settings.currencies.update",{currency:u.currency.id}),{onSuccess:s=>f.showNotification(s)})}return(s,a)=>{const g=v("AppLayout");return U(),S(g,{back:s.route("admin.settings.currencies.index"),title:s.$t("Edit Currency")},{"sub-navbar":t(()=>[l(N)]),default:t(()=>[l(F,null,{default:t(()=>[l(w,null,{default:t(()=>[l(C,null,{default:t(()=>[i(p(s.$t("Edit Currency")),1)]),_:1}),l(k,null,{default:t(()=>[i(p(s.$t("Here you can edit currency information")),1)]),_:1}),l(q,null,{default:t(()=>[l(D,{onSubmit:A(y,["prevent"])},{default:t(()=>[l(E,null,{default:t(()=>[l(m,{cols:"12",lg:"6"},{default:t(()=>[l(d,{modelValue:e(r).name,"onUpdate:modelValue":a[0]||(a[0]=o=>e(r).name=o),"error-messages":e(r).errors.name,label:s.$t("Name"),rules:[e(n).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(d,{modelValue:e(r).code,"onUpdate:modelValue":a[1]||(a[1]=o=>e(r).code=o),"error-messages":e(r).errors.code,label:s.$t("Code"),rules:[e(n).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(d,{modelValue:e(r).rate,"onUpdate:modelValue":a[2]||(a[2]=o=>e(r).rate=o),"error-messages":e(r).errors.rate,label:s.$t("Rate"),rules:[e(n).required],type:"number"},null,8,["modelValue","error-messages","label","rules"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(c,{modelValue:e(r).precision,"onUpdate:modelValue":a[3]||(a[3]=o=>e(r).precision=o),"error-messages":e(r).errors.precision,items:["0",1,2,3,4],label:s.$t("Precision"),rules:[e(n).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(d,{modelValue:e(r).symbol,"onUpdate:modelValue":a[4]||(a[4]=o=>e(r).symbol=o),"error-messages":e(r).errors.symbol,label:s.$t("Symbol"),rules:[e(n).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(c,{modelValue:e(r).swap_currency_symbol,"onUpdate:modelValue":a[5]||(a[5]=o=>e(r).swap_currency_symbol=o),"error-messages":e(r).errors.swap_currency_symbol,items:[{title:s.$t("After Amount"),value:!0},{title:s.$t("Before Amount"),value:!1}],label:s.$t("Symbol Position")},null,8,["modelValue","error-messages","items","label"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(d,{modelValue:e(r).decimal_separator,"onUpdate:modelValue":a[6]||(a[6]=o=>e(r).decimal_separator=o),"error-messages":e(r).errors.decimal_separator,label:s.$t("Decimal Separator"),rules:[e(n).required]},null,8,["modelValue","error-messages","label","rules"])]),_:1}),l(m,{cols:"12",lg:"6"},{default:t(()=>[l(d,{modelValue:e(r).thousand_separator,"onUpdate:modelValue":a[7]||(a[7]=o=>e(r).thousand_separator=o),"error-messages":e(r).errors.thousand_separator,label:s.$t("Thousands Separator")},null,8,["modelValue","error-messages","label"])]),_:1})]),_:1}),l(m,{cols:"12"},{default:t(()=>[l(V,{modelValue:e(r).is_active,"onUpdate:modelValue":a[8]||(a[8]=o=>e(r).is_active=o),"error-messages":e(r).errors.is_active,label:s.$t("Active"),class:"mb-5"},null,8,["modelValue","error-messages","label"]),l(V,{modelValue:e(r).is_default,"onUpdate:modelValue":a[9]||(a[9]=o=>e(r).is_default=o),"error-messages":e(r).errors.is_default,label:s.$t("Default"),class:"mb-5"},null,8,["modelValue","error-messages","label"])]),_:1}),l(T,{loading:e(r).processing,type:"submit"},{default:t(()=>[l(B,{icon:"mdi-content-save"}),i(" "+p(s.$t("Update")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1},8,["back","title"])}}};export{Z as default};
