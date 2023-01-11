import{q as U,N as b,B as w,a6 as G,y as i,$ as j,ak as m,s as R,d,M as q,as as L,af as N,ab as Z,A as p,at as z,r as g,C as H,E as J,G as K,n as Q,D as F,ae as W,a1 as X,ac as Y,Z as $,a3 as ee,au as D}from"./app.024f86d4.js";import{e as le}from"./VCounter.2419f175.js";const E=Symbol.for("vuetify:selection-control-group");U({name:"VSelectionControlGroup",props:{disabled:Boolean,id:String,inline:Boolean,name:String,falseIcon:b,trueIcon:b,multiple:{type:Boolean,default:null},readonly:Boolean,type:String,modelValue:null},emits:{"update:modelValue":e=>!0},setup(e,l){let{slots:v}=l;const a=w(e,"modelValue"),r=G(),n=i(()=>e.id||`v-selection-control-group-${r}`),c=i(()=>e.name||n.value);return j(E,{disabled:m(e,"disabled"),inline:m(e,"inline"),modelValue:a,multiple:i(()=>!!e.multiple||e.multiple==null&&Array.isArray(a.value)),name:c,falseIcon:m(e,"falseIcon"),trueIcon:m(e,"trueIcon"),readonly:m(e,"readonly"),type:m(e,"type")}),R(()=>{var t;return d("div",{class:["v-selection-control-group",{"v-selection-control-group--inline":e.inline}],"aria-labelled-by":e.type==="radio"?n.value:void 0,role:e.type==="radio"?"radiogroup":void 0},[(t=v.default)==null?void 0:t.call(v)])}),{}}});const ae=q({color:String,disabled:Boolean,error:Boolean,id:String,inline:Boolean,label:String,falseIcon:b,trueIcon:b,ripple:{type:Boolean,default:!0},multiple:{type:Boolean,default:null},name:String,readonly:Boolean,trueValue:null,falseValue:null,modelValue:null,type:String,value:null,valueComparator:{type:Function,default:L},...N(),...Z()});function ne(e){const l=X(E,void 0),{densityClasses:v}=Y(e),a=w(e,"modelValue"),r=i(()=>e.trueValue!==void 0?e.trueValue:e.value!==void 0?e.value:!0),n=i(()=>e.falseValue!==void 0?e.falseValue:!1),c=i(()=>(l==null?void 0:l.multiple.value)||!!e.multiple||e.multiple==null&&Array.isArray(a.value)),t=i({get(){const u=l?l.modelValue.value:a.value;return c.value?u.some(o=>e.valueComparator(o,r.value)):e.valueComparator(u,r.value)},set(u){if(e.readonly)return;const o=u?r.value:n.value;let s=o;c.value&&(s=u?[...$(a.value),o]:$(a.value).filter(y=>!e.valueComparator(y,r.value))),l?l.modelValue.value=s:a.value=s}}),{textColorClasses:V,textColorStyles:C}=ee(i(()=>t.value&&!e.error&&!e.disabled?e.color:void 0)),S=i(()=>{var u,o;return t.value?(u=l==null?void 0:l.trueIcon.value)!=null?u:e.trueIcon:(o=l==null?void 0:l.falseIcon.value)!=null?o:e.falseIcon});return{group:l,densityClasses:v,trueValue:r,falseValue:n,model:t,textColorClasses:V,textColorStyles:C,icon:S}}const te=p()({name:"VSelectionControl",directives:{Ripple:z},inheritAttrs:!1,props:ae(),emits:{"update:modelValue":e=>!0},setup(e,l){let{attrs:v,slots:a}=l;const{densityClasses:r,group:n,icon:c,model:t,textColorClasses:V,textColorStyles:C,trueValue:S}=ne(e),u=G(),o=i(()=>e.id||`input-${u}`),s=g(!1),y=g(!1),I=g();function B(f){s.value=!0,(!D||D&&f.target.matches(":focus-visible"))&&(y.value=!0)}function k(){s.value=!1,y.value=!1}function M(f){t.value=f.target.checked}return R(()=>{var x,P;var f,A;const _=a.label?a.label({label:e.label,props:{for:o.value}}):e.label,h=(x=n==null?void 0:n.type.value)!=null?x:e.type,[O,T]=H(v);return d("div",F({class:["v-selection-control",{"v-selection-control--dirty":t.value,"v-selection-control--disabled":e.disabled,"v-selection-control--error":e.error,"v-selection-control--focused":s.value,"v-selection-control--focus-visible":y.value,"v-selection-control--inline":(n==null?void 0:n.inline.value)||e.inline},r.value]},O),[d("div",{class:["v-selection-control__wrapper",V.value],style:C.value},[(f=a.default)==null?void 0:f.call(a),J(d("div",{class:["v-selection-control__input"]},[c.value&&d(Q,{key:"icon",icon:c.value},null),d("input",F({ref:I,checked:t.value,disabled:e.disabled,id:o.value,onBlur:k,onFocus:B,onInput:M,"aria-readonly":e.readonly,type:h,value:S.value,name:(P=n==null?void 0:n.name.value)!=null?P:e.name,"aria-checked":h==="checkbox"?t.value:void 0},T),null),(A=a.input)==null?void 0:A.call(a,{model:t,textColorClasses:V,props:{onFocus:B,onBlur:k,id:o.value}})]),[[K("ripple"),e.ripple&&[!e.disabled&&!e.readonly,null,["center","circle"]]]])]),_&&d(le,{for:o.value},{default:()=>[_]})])}),{isFocused:s,input:I}}});function ie(e){return W(e,Object.keys(te.props))}export{te as V,ie as f,ae as m};
