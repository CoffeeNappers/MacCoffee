.class Lcom/google/android/gms/internal/zzda$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzda$2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzawx:Lcom/google/android/gms/internal/zzda$2;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzda$2;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzda$2$1;->zzawx:Lcom/google/android/gms/internal/zzda$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzda$2$1;->zzaf(Ljava/lang/String;)V

    return-void
.end method

.method public zzaf(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzda$2$1;->zzawx:Lcom/google/android/gms/internal/zzda$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzda$2;->zzaws:Lcom/google/android/gms/internal/zzda;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzda$2$1;->zzawx:Lcom/google/android/gms/internal/zzda$2;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzda$2;->zzawu:Lcom/google/android/gms/internal/zzcx;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzda$2$1;->zzawx:Lcom/google/android/gms/internal/zzda$2;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzda$2;->zzawv:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzda$2$1;->zzawx:Lcom/google/android/gms/internal/zzda$2;

    iget-boolean v3, v3, Lcom/google/android/gms/internal/zzda$2;->zzaww:Z

    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/google/android/gms/internal/zzda;->zza(Lcom/google/android/gms/internal/zzcx;Landroid/webkit/WebView;Ljava/lang/String;Z)V

    return-void
.end method
