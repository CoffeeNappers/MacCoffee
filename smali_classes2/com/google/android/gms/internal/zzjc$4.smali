.class Lcom/google/android/gms/internal/zzjc$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjc;->zzb(Ljava/lang/ref/WeakReference;)Landroid/view/ViewTreeObserver$OnScrollChangedListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzciv:Lcom/google/android/gms/internal/zzjc;

.field final synthetic zzcix:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjc;Ljava/lang/ref/WeakReference;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjc$4;->zzciv:Lcom/google/android/gms/internal/zzjc;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjc$4;->zzcix:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollChanged()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$4;->zzciv:Lcom/google/android/gms/internal/zzjc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjc$4;->zzcix:Ljava/lang/ref/WeakReference;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/zzjc;->zza(Lcom/google/android/gms/internal/zzjc;Ljava/lang/ref/WeakReference;Z)V

    return-void
.end method
