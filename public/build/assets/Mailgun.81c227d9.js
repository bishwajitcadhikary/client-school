import{r as n}from"./rules.bd1e245b.js";import{u as s}from"./useMailDriverStore.08d0f0d8.js";import{V as f}from"./VForm.2f49ab8c.js";import{V as u}from"./VCol.19781618.js";import{V}from"./VSelect.2b406d4f.js";import{V as t}from"./VTextField.4f31bb4a.js";import{V as p}from"./VRow.a17a7fb6.js";import{c as _,w as i,o as b,d as m,k as e,bv as g}from"./app.024f86d4.js";import"./form.51b8e79f.js";/* empty css              */import"./VCheckboxBtn.26820d3d.js";import"./VSelectionControl.e3763b2e.js";import"./VCounter.2419f175.js";const A={__name:"Mailgun",setup(v){const l=s();function d(r){l.form.mail_driver=r}return(r,o)=>(b(),_(f,null,{default:i(()=>[m(p,null,{default:i(()=>[m(u,{cols:"12",sm:"6"},{default:i(()=>[m(V,{modelValue:e(l).form.mail_driver,"onUpdate:modelValue":[o[0]||(o[0]=a=>e(l).form.mail_driver=a),d],label:r.$t("Mail Driver"),items:e(l).mail_drivers,rules:[e(n).required]},null,8,["modelValue","label","items","rules"])]),_:1}),m(u,{cols:"12",sm:"6"},{default:i(()=>[m(t,{modelValue:e(l).form.mailgun.mail_mailgun_domain,"onUpdate:modelValue":o[1]||(o[1]=a=>e(l).form.mailgun.mail_mailgun_domain=a),label:r.$t("Domain")},null,8,["modelValue","label"])]),_:1}),m(u,{cols:"12",sm:"6"},{default:i(()=>[m(t,{modelValue:e(l).form.mail_mailgun_secret,"onUpdate:modelValue":o[2]||(o[2]=a=>e(l).form.mail_mailgun_secret=a),label:r.$t("Mailgun Secret")},null,8,["modelValue","label"])]),_:1}),m(u,{cols:"12",sm:"6"},{default:i(()=>[m(t,{modelValue:e(l).form.mail_mailgun_endpoint,"onUpdate:modelValue":o[3]||(o[3]=a=>e(l).form.mail_mailgun_endpoint=a),label:r.$t("Mailgun Endpoint")},null,8,["modelValue","label"])]),_:1}),m(u,{cols:"12",sm:"6"},{default:i(()=>[m(t,{modelValue:e(l).form.mail_from_address,"onUpdate:modelValue":o[4]||(o[4]=a=>e(l).form.mail_from_address=a),label:r.$t("Mail From Address"),type:"email"},null,8,["modelValue","label"])]),_:1}),m(u,{cols:"12",sm:"6"},{default:i(()=>[m(t,{modelValue:e(l).form.mail_from_name,"onUpdate:modelValue":o[5]||(o[5]=a=>e(l).form.mail_from_name=a),label:r.$t("Mail From Name")},null,8,["modelValue","label"])]),_:1})]),_:1}),g(r.$slots,"default")]),_:3}))}};export{A as default};
