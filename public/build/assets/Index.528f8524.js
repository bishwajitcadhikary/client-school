import{u as y,r as b,a as C,c as S,w as s,b as $,o as k,d as e,V as U,e as _,f as p,g as f,h as P,i as T,j as A,k as a,m as I,n as N}from"./app.c74c21f4.js";import{r as g}from"./rules.aed30137.js";import j from"./SettingsDrawerContent.4e2e494c.js";import{V as q}from"./VForm.64f4569b.js";import{V as B}from"./VRow.51c37cbe.js";import{V as n}from"./VCol.fb68aa0d.js";import{V as i}from"./VTextField.2cf6dc35.js";import{V as F}from"./VSelect.5810ae9c.js";import{V as L}from"./VContainer.9871394f.js";import"./form.655e4f4e.js";/* empty css              */import"./VCounter.bd549793.js";import"./VLabel.2a4a1171.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";const Z={__name:"Index",props:{languages:{type:Object,default:null},user:{type:Object,required:!0}},setup(V){const d=V,w=y(),u=b(!1),m=b(!1),o=C({_method:"PUT",name:d.user.name,email:d.user.email,password:null,password_confirmation:null,language:d.user.language_id});function c(){o.post(route("admin.settings.account-settings.update"),{onSuccess:r=>{w.showNotification(r)}})}return(r,l)=>{const v=$("AppLayout");return k(),S(v,{title:r.$t("Account Settings")},{"sub-navbar":s(()=>[e(j)]),default:s(()=>[e(L,null,{default:s(()=>[e(U,null,{default:s(()=>[e(_,null,{default:s(()=>[p(f(r.$t("Account Settings")),1)]),_:1}),e(P,null,{default:s(()=>[p(f(r.$t("You can update your name, email & password using the form below.")),1)]),_:1}),e(T,null,{default:s(()=>[e(q,{onSubmit:A(c,["prevent"])},{default:s(()=>[e(B,null,{default:s(()=>[e(n,{cols:"12",sm:"6"},{default:s(()=>[e(i,{modelValue:a(o).name,"onUpdate:modelValue":l[0]||(l[0]=t=>a(o).name=t),label:r.$t("Name"),rules:[a(g).required],"error-messages":a(o).errors.name},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(n,{cols:"12",sm:"6"},{default:s(()=>[e(i,{modelValue:a(o).email,"onUpdate:modelValue":l[1]||(l[1]=t=>a(o).email=t),label:r.$t("Email"),rules:[a(g).required,a(g).email],"error-messages":a(o).errors.email},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(n,{cols:"12",sm:"6"},{default:s(()=>[e(i,{modelValue:a(o).password,"onUpdate:modelValue":l[2]||(l[2]=t=>a(o).password=t),label:r.$t("Password"),"error-messages":a(o).errors.password,"append-inner-icon":u.value?"mdi-eye":"mdi-eye-off",type:u.value?"text":"password","onClick:appendInner":l[3]||(l[3]=t=>u.value=!u.value)},null,8,["modelValue","label","error-messages","append-inner-icon","type"])]),_:1}),e(n,{cols:"12",sm:"6"},{default:s(()=>[e(i,{modelValue:a(o).password_confirmation,"onUpdate:modelValue":l[4]||(l[4]=t=>a(o).password_confirmation=t),label:r.$t("Confirm Password"),"error-messages":a(o).errors.password_confirmation,"append-inner-icon":m.value?"mdi-eye":"mdi-eye-off",type:m.value?"text":"password","onClick:appendInner":l[5]||(l[5]=t=>m.value=!m.value)},null,8,["modelValue","label","error-messages","append-inner-icon","type"])]),_:1}),e(n,{cols:"12",sm:"6"},{default:s(()=>[e(F,{modelValue:a(o).language,"onUpdate:modelValue":l[6]||(l[6]=t=>a(o).language=t),label:r.$t("Language"),"error-messages":a(o).errors.language,items:V.languages},null,8,["modelValue","label","error-messages","items"])]),_:1}),e(n,{cols:"12"},{default:s(()=>[e(I,{type:"submit",loading:a(o).processing},{default:s(()=>[e(N,{icon:"mdi-content-save"}),p(" "+f(r.$t("Save")),1)]),_:1},8,["loading"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1},8,["title"])}}};export{Z as default};