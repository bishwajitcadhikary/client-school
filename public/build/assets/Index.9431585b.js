import{u as c}from"./useMailDriverStore.b7275ea9.js";import a from"./Smtp.014b0d53.js";import m from"./Basic.24effd1f.js";import v from"./Mailgun.d1c05399.js";import C from"./Ses.3593e2a5.js";import g from"./SettingsDrawerContent.bba35f6a.js";import{y as V,c as n,w as r,b as y,o as s,d as e,V as $,e as h,f,g as t,i as D,av as S,bG as b,k as B,m as k}from"./app.ff209ba5.js";import{V as M}from"./VCol.196fcba1.js";import{V as w}from"./VContainer.70025531.js";import"./rules.06076658.js";import"./VForm.75801f54.js";import"./form.96b9598d.js";import"./VSelect.c3f11ce8.js";import"./VCheckboxBtn.510f2727.js";import"./VSelectionControl.67abed86.js";import"./VCounter.feafebbb.js";import"./VTextField.7da22a41.js";import"./VRow.1d74aad8.js";/* empty css              */const U={__name:"Index",props:{mailConfig:{type:Array,required:!0}},setup(l){const p=l,o=c();o.form,o.getMailConfig(p.mailConfig);const u=V(()=>o.form.mail_driver==="mailgun"?v:o.form.mail_driver==="sendmail"?m:o.form.mail_driver==="mail"?m:o.form.mail_driver==="ses"?C:o.form.mail_driver==="smtp"?a:a);function d(){}return(i,A)=>{const _=y("AppLayout");return s(),n(_,{title:i.$t("Mail Configuration")},{"sub-navbar":r(()=>[e(g)]),default:r(()=>[e(w,null,{default:r(()=>[e($,{class:"pa-2"},{default:r(()=>[e(h,null,{default:r(()=>[f(t(i.$t("Mail Configuration")),1)]),_:1}),e(D,null,{default:r(()=>[S("p",null,t(i.$t("Below is the form for Configuring Email driver for sending emails from the app. You can also configure third party providers like Sendgrid, SES etc.")),1),(s(),n(b(B(u)),{onOnChangeDriver:d},{default:r(()=>[e(M,{cols:"12"},{default:r(()=>[e(k,{type:"submit"},{default:r(()=>[f(t(i.$t("Save")),1)]),_:1})]),_:1})]),_:1},32))]),_:1})]),_:1})]),_:1})]),_:1},8,["title"])}}};export{U as default};
