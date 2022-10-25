.class Lcom/google/android/gms/internal/zzjc$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjc;->zzg(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/zzlt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcit:Lorg/json/JSONObject;

.field final synthetic zzciu:Lcom/google/android/gms/internal/zzlq;

.field final synthetic zzciv:Lcom/google/android/gms/internal/zzjc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjc;Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzlq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjc$1;->zzcit:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciu:Lcom/google/android/gms/internal/zzlq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzjc;->zzsx()Lcom/google/android/gms/internal/zzmd;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzjc;->zza(Lcom/google/android/gms/internal/zzjc;)Lcom/google/android/gms/ads/internal/zzq;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq;->zzc(Lcom/google/android/gms/internal/zzmd;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzxc()Lcom/google/android/gms/internal/zzme;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/zzjc;->zza(Lcom/google/android/gms/internal/zzjc;Ljava/lang/ref/WeakReference;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-static {v4, v0}, Lcom/google/android/gms/internal/zzjc;->zzb(Lcom/google/android/gms/internal/zzjc;Ljava/lang/ref/WeakReference;)Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/internal/zzme;->zza(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzjc;->zza(Lcom/google/android/gms/internal/zzjc;Lcom/google/android/gms/internal/zzmd;)V

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzxc()Lcom/google/android/gms/internal/zzme;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzjc$1$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/internal/zzjc$1$1;-><init>(Lcom/google/android/gms/internal/zzjc$1;Lcom/google/android/gms/internal/zzmd;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/internal/zzme$zzb;)V

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzxc()Lcom/google/android/gms/internal/zzme;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzjc$1$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzjc$1$2;-><init>(Lcom/google/android/gms/internal/zzjc$1;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/internal/zzme$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzjc;->zzb(Lcom/google/android/gms/internal/zzjc;)Lcom/google/android/gms/internal/zzko$zza;

    move-result-object v2

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbiy:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzja;->zza(Lcom/google/android/gms/internal/zzko$zza;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzmd;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Exception occurred while getting video view"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$1;->zzciu:Lcom/google/android/gms/internal/zzlq;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V

    goto :goto_0
.end method
