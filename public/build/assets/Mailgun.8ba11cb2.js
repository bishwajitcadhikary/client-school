import{r as n}from"./rules.04dd8ab5.js";import{u as s}from"./useMailDriverStore.3b4073f0.js";import{V as f}from"./VForm.02b40034.js";import{V as u}from"./VCol.4d479741.js";import{V}from"./VSelect.20e484dd.js";import{c as p,w as i,o as _,a,u as e,aE as d,bp as b}from"./app.769d2bc8.js";import{V as g}from"./VRow.0d9576a1.js";/* empty css              */import"./VCheckboxBtn.416dd0ae.js";import"./VChip.9639af3b.js";const E={__name:"Mailgun",setup(v){const l=s();function t(r){l.form.mail_driver=r}return(r,m)=>(_(),p(f,null,{default:i(()=>[a(g,null,{default:i(()=>[a(u,{cols:"12",sm:"6"},{default:i(()=>[a(V,{modelValue:e(l).form.mail_driver,"onUpdate:modelValue":[m[0]||(m[0]=o=>e(l).form.mail_driver=o),t],label:r.$t("Mail Driver"),items:e(l).mail_drivers,rules:[e(n).required]},null,8,["modelValue","label","items","rules"])]),_:1}),a(u,{cols:"12",sm:"6"},{default:i(()=>[a(d,{modelValue:e(l).form.mailgun.mail_mailgun_domain,"onUpdate:modelValue":m[1]||(m[1]=o=>e(l).form.mailgun.mail_mailgun_domain=o),label:r.$t("Domain")},null,8,["modelValue","label"])]),_:1}),a(u,{cols:"12",sm:"6"},{default:i(()=>[a(d,{modelValue:e(l).form.mail_mailgun_secret,"onUpdate:modelValue":m[2]||(m[2]=o=>e(l).form.mail_mailgun_secret=o),label:r.$t("Mailgun Secret")},null,8,["modelValue","label"])]),_:1}),a(u,{cols:"12",sm:"6"},{default:i(()=>[a(d,{modelValue:e(l).form.mail_mailgun_endpoint,"onUpdate:modelValue":m[3]||(m[3]=o=>e(l).form.mail_mailgun_endpoint=o),label:r.$t("Mailgun Endpoint")},null,8,["modelValue","label"])]),_:1}),a(u,{cols:"12",sm:"6"},{default:i(()=>[a(d,{modelValue:e(l).form.mail_from_address,"onUpdate:modelValue":m[4]||(m[4]=o=>e(l).form.mail_from_address=o),label:r.$t("Mail From Address"),type:"email"},null,8,["modelValue","label"])]),_:1}),a(u,{cols:"12",sm:"6"},{default:i(()=>[a(d,{modelValue:e(l).form.mail_from_name,"onUpdate:modelValue":m[5]||(m[5]=o=>e(l).form.mail_from_name=o),label:r.$t("Mail From Name")},null,8,["modelValue","label"])]),_:1})]),_:1}),b(r.$slots,"default")]),_:3}))}};export{E as default};
