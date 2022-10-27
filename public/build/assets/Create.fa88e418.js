import{s as x,bm as _,S as ee,bn as le,J as ae,K as te,B as V,bD as T,r as h,y as ne,ap as oe,bq as re,br as se,d as l,bs as ue,O as P,M as z,bu as ie,bv as de,z as ce,bw as L,aD as me,u as fe,a as G,c as pe,w as c,b as ve,o as be,V as ge,e as Ve,f as R,g as A,h as ye,i as Ce,j as ke,l as I,k as t,n as Se,p as we}from"./app.bb08e2ce.js";import{r as q}from"./rules.3cb1014a.js";import $e from"./SettingsDrawerContent.6e3284e9.js";import{V as he}from"./VRow.30a8db2d.js";import{V as Ie}from"./VCol.b330a76f.js";import{V as Fe}from"./VForm.c256084f.js";import{V as Be}from"./VChip.7e261ff6.js";import{V as Pe}from"./VSelect.d3ab3368.js";import{V as ze}from"./VTextarea.8335ac69.js";import{V as Re}from"./VSwitch.f974743d.js";import{V as Ae}from"./VContainer.6c0aeef1.js";import"./VCheckboxBtn.a6269670.js";import"./VSelectionControl.5dca4523.js";/* empty css              */const Ue=x({name:"VFileInput",inheritAttrs:!1,props:{chips:Boolean,counter:Boolean,counterSizeString:{type:String,default:"$vuetify.fileInput.counterSize"},counterString:{type:String,default:"$vuetify.fileInput.counter"},multiple:Boolean,hint:String,persistentHint:Boolean,placeholder:String,showSize:{type:[Boolean,Number],default:!1,validator:e=>typeof e=="boolean"||[1e3,1024].includes(e)},..._({prependIcon:"$file"}),modelValue:{type:Array,default:()=>[],validator:e=>ee(e).every(f=>f!=null&&typeof f=="object")},...le({clearable:!0})},emits:{"click:control":e=>!0,"update:modelValue":e=>!0},setup(e,f){let{attrs:F,emit:o,slots:s}=f;const{t:S}=ae(),i=te(e,"modelValue"),w=V(()=>typeof e.showSize!="boolean"?e.showSize:void 0),a=V(()=>{var n;return((n=i.value)!=null?n:[]).reduce((d,m)=>{let{size:C=0}=m;return d+C},0)}),r=V(()=>T(a.value,w.value)),p=V(()=>{var n;return((n=i.value)!=null?n:[]).map(d=>{const{name:m="",size:C=0}=d;return e.showSize?`${m} (${T(C,w.value)})`:m})}),u=V(()=>{var m;var n;const d=(m=(n=i.value)==null?void 0:n.length)!=null?m:0;return e.showSize?S(e.counterSizeString,d,r.value):S(e.counterString,d)}),v=h(),U=h(),y=h(!1),b=h(),H=V(()=>e.messages.length?e.messages:e.persistentHint?e.hint:"");function B(){if(b.value!==document.activeElement){var n;(n=b.value)==null||n.focus()}y.value||(y.value=!0)}function M(n){L(e["onClick:prepend"],n),N(n)}function N(n){var d;(d=b.value)==null||d.click(),o("click:control",n)}function E(n){n.stopPropagation(),B(),me(()=>{i.value=[],b!=null&&b.value&&(b.value.value=""),L(e["onClick:clear"],n)})}return ne(()=>{const n=!!(s.counter||e.counter),d=!!(n||s.details),[m,C]=oe(F),[{modelValue:Ne,...O}]=re(e),[J]=se(e);return l(de,P({ref:v,modelValue:i.value,"onUpdate:modelValue":k=>i.value=k,class:"v-file-input","onClick:prepend":M,"onClick:append":e["onClick:append"]},m,O,{messages:H.value}),{...s,default:k=>{let{isDisabled:$,isDirty:j,isReadonly:K,isValid:Q}=k;return l(ue,P({ref:U,"prepend-icon":e.prependIcon,"onClick:control":N,"onClick:clear":E,"onClick:prependInner":e["onClick:prependInner"],"onClick:appendInner":e["onClick:appendInner"]},J,{active:j.value||y.value,dirty:j.value,focused:y.value,error:Q.value===!1}),{...s,default:W=>{let{props:{class:X,...Y}}=W;return l(z,null,[l("input",P({ref:b,type:"file",readonly:K.value,disabled:$.value,multiple:e.multiple,name:e.name,onClick:g=>{g.stopPropagation(),B()},onChange:g=>{var D;if(!g.target)return;const Z=g.target;i.value=[...(D=Z.files)!=null?D:[]]},onFocus:B,onBlur:()=>y.value=!1},Y,C),null),l("div",{class:X},[i.value.length>0&&(s.selection?s.selection({fileNames:p.value,totalBytes:a.value,totalBytesReadable:r.value}):e.chips?p.value.map(g=>l(Be,{key:g,size:"small",color:e.color},{default:()=>[g]})):p.value.join(", "))])])}})},details:d?k=>{var $;return l(z,null,[($=s.details)==null?void 0:$.call(s,k),n&&l(z,null,[l("span",null,null),l(ie,{active:!!i.value.length,value:u.value},s.counter)])])}:void 0})}),ce({},v,U,b)}}),Xe={__name:"Create",props:{currencies:{type:Object,default:null}},setup(e){const f=e,F=fe(),o=G({name:null,logo:null,currency:null,charge:0,is_active:!0,instruction:null}),s=G({code:null,rate:null,symbol:null});function S(){o.post(route("admin.settings.gateways.store"),{onSuccess:a=>{F.showNotification(a)}})}function i(a){a.length>0?o.logo=a[0]:o.logo=null}function w(a){var r,p,u;s.code=(r=f.currencies.find(v=>v.value==a))==null?void 0:r.code,s.rate=(p=f.currencies.find(v=>v.value==a))==null?void 0:p.rate,s.symbol=(u=f.currencies.find(v=>v.value==a))==null?void 0:u.symbol}return(a,r)=>{const p=ve("AdminLayout");return be(),pe(p,{title:a.$t("Create Gateway"),back:a.route("admin.settings.gateways.index")},{"sub-navbar":c(()=>[l($e)]),default:c(()=>[l(Ae,null,{default:c(()=>[l(he,null,{default:c(()=>[l(Ie,{cols:"12",sm:"8"},{default:c(()=>[l(ge,null,{default:c(()=>[l(Ve,null,{default:c(()=>[R(A(a.$t("Create Gateway")),1)]),_:1}),l(ye,null,{default:c(()=>[R(A(a.$t("Here you can create new payment gateway")),1)]),_:1}),l(Ce,null,{default:c(()=>[l(Fe,{onSubmit:ke(S,["prevent"])},{default:c(()=>[l(I,{modelValue:t(o).name,"onUpdate:modelValue":r[0]||(r[0]=u=>t(o).name=u),class:"mb-5",label:a.$t("Gateway Name"),rules:[t(q).required]},null,8,["modelValue","label","rules"]),l(Ue,{class:"mb-5",accept:"image/png, image/jpeg, image/jpg",label:a.$t("Logo"),placeholder:a.$t("Pick gateway logo"),"error-messages":t(o).errors.logo,"onUpdate:modelValue":i},null,8,["label","placeholder","error-messages"]),l(Pe,{modelValue:t(o).currency,"onUpdate:modelValue":[r[1]||(r[1]=u=>t(o).currency=u),w],class:"mb-5",label:a.$t("Currency"),items:e.currencies,rules:[t(q).required],"error-messages":t(o).errors.currency},null,8,["modelValue","label","items","rules","error-messages"]),l(I,{modelValue:t(s).code,"onUpdate:modelValue":r[2]||(r[2]=u=>t(s).code=u),class:"mb-5",label:a.$t("Currency Code"),disabled:""},null,8,["modelValue","label"]),l(I,{modelValue:t(s).rate,"onUpdate:modelValue":r[3]||(r[3]=u=>t(s).rate=u),class:"mb-5",prefix:t(s).symbol,label:a.$t("Currency Rate"),disabled:""},null,8,["modelValue","prefix","label"]),l(I,{modelValue:t(o).charge,"onUpdate:modelValue":r[4]||(r[4]=u=>t(o).charge=u),type:"number",class:"mb-5",prefix:t(s).symbol,label:a.$t("Gateway Charge"),"error-messages":t(o).errors.charge},null,8,["modelValue","prefix","label","error-messages"]),l(ze,{modelValue:t(o).instruction,"onUpdate:modelValue":r[5]||(r[5]=u=>t(o).instruction=u),class:"mb-5",label:a.$t("Payment Instruction"),"error-messages":t(o).errors.instruction},null,8,["modelValue","label","error-messages"]),l(Re,{modelValue:t(o).is_active,"onUpdate:modelValue":r[6]||(r[6]=u=>t(o).is_active=u),class:"mb-5",label:a.$t("Active"),"error-messages":t(o).errors.is_active},null,8,["modelValue","label","error-messages"]),l(Se,{type:"submit",loading:t(o).processing},{default:c(()=>[l(we,{icon:"mdi-content-save"}),R(" "+A(a.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{Xe as default};
