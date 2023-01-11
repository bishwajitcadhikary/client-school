import{m as U,a as Y,f as Z,b as G,V as J,c as O,d as Q}from"./VCounter.2419f175.js";import{q as W,Z as X,R as ee,B as le,y as r,bk as R,r as p,s as te,C as ne,d as n,D as y,H as k,Y as ae,v as oe,L as $,K as ue}from"./app.024f86d4.js";const ce=W({name:"VFileInput",inheritAttrs:!1,props:{chips:Boolean,counter:Boolean,counterSizeString:{type:String,default:"$vuetify.fileInput.counterSize"},counterString:{type:String,default:"$vuetify.fileInput.counter"},multiple:Boolean,hint:String,persistentHint:Boolean,placeholder:String,showSize:{type:[Boolean,Number],default:!1,validator:e=>typeof e=="boolean"||[1e3,1024].includes(e)},...U({prependIcon:"$file"}),modelValue:{type:Array,default:()=>[],validator:e=>X(e).every(v=>v!=null&&typeof v=="object")},...Y({clearable:!0})},emits:{"click:control":e=>!0,"update:modelValue":e=>!0},setup(e,v){let{attrs:w,emit:A,slots:a}=v;const{t:h}=ee(),o=le(e,"modelValue"),V=r(()=>typeof e.showSize!="boolean"?e.showSize:void 0),I=r(()=>{var l;return((l=o.value)!=null?l:[]).reduce((t,u)=>{let{size:d=0}=u;return t+d},0)}),S=r(()=>R(I.value,V.value)),g=r(()=>{var l;return((l=o.value)!=null?l:[]).map(t=>{const{name:u="",size:d=0}=t;return e.showSize?`${u} (${R(d,V.value)})`:u})}),D=r(()=>{var u;var l;const t=(u=(l=o.value)==null?void 0:l.length)!=null?u:0;return e.showSize?h(e.counterSizeString,t,S.value):h(e.counterString,t)}),b=p(),z=p(),c=p(!1),i=p(),N=r(()=>e.messages.length?e.messages:e.persistentHint?e.hint:"");function C(){if(i.value!==document.activeElement){var l;(l=i.value)==null||l.focus()}c.value||(c.value=!0)}function H(l){$(e["onClick:prepend"],l),F(l)}function F(l){var t;(t=i.value)==null||t.click(),A("click:control",l)}function _(l){l.stopPropagation(),C(),ue(()=>{o.value=[],i!=null&&i.value&&(i.value.value=""),$(e["onClick:clear"],l)})}return te(()=>{const l=!!(a.counter||e.counter),t=!!(l||a.details),[u,d]=ne(w),[{modelValue:ie,...j}]=Z(e),[x]=G(e);return n(Q,y({ref:b,modelValue:o.value,"onUpdate:modelValue":f=>o.value=f,class:"v-file-input","onClick:prepend":H,"onClick:append":e["onClick:append"]},u,j,{messages:N.value}),{...a,default:f=>{let{isDisabled:m,isDirty:P,isReadonly:E,isValid:L}=f;return n(J,y({ref:z,"prepend-icon":e.prependIcon,"onClick:control":F,"onClick:clear":_,"onClick:prependInner":e["onClick:prependInner"],"onClick:appendInner":e["onClick:appendInner"]},x,{active:P.value||c.value,dirty:P.value,focused:c.value,error:L.value===!1}),{...a,default:q=>{let{props:{class:K,...M}}=q;return n(k,null,[n("input",y({ref:i,type:"file",readonly:E.value,disabled:m.value,multiple:e.multiple,name:e.name,onClick:s=>{s.stopPropagation(),C()},onChange:s=>{var B;if(!s.target)return;const T=s.target;o.value=[...(B=T.files)!=null?B:[]]},onFocus:C,onBlur:()=>c.value=!1},M,d),null),n("div",{class:K},[o.value.length>0&&(a.selection?a.selection({fileNames:g.value,totalBytes:I.value,totalBytesReadable:S.value}):e.chips?g.value.map(s=>n(ae,{key:s,size:"small",color:e.color},{default:()=>[s]})):g.value.join(", "))])])}})},details:t?f=>{var m;return n(k,null,[(m=a.details)==null?void 0:m.call(a,f),l&&n(k,null,[n("span",null,null),n(O,{active:!!o.value.length,value:D.value},a.counter)])])}:void 0})}),oe({},b,z,i)}});export{ce as V};
