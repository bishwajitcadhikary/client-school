<template>
  <div class="w-100 h-100 d-flex align-center justify-space-between">
    <!-- 👉 Footer: left content -->
    <span class="d-flex align-center">
      &copy;
      {{ new Date().getFullYear() }}
      Developed With
      <VIcon
        icon="mdi-heart-outline"
        color="error"
        size="1.25rem"
        class="mx-1"
      />
      By <a
        href="https://facebook.com/bishwajitcadhikary"
        target="_blank"
        rel="noopener noreferrer"
        class="text-primary ms-1"
      >Bishwajit Adhikary</a>
    </span>
    <!-- 👉 Footer: right content -->
    <span class="d-md-flex gap-x-4 text-primary d-none">
      <a
        href="https://mydokani.com/"
        target="noopener noreferrer"
      >MyDokani</a>
    </span>
  </div>
</template>
