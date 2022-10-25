.class Lcom/google/android/gms/internal/zzgg$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgg;->zzbp(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbtg:Ljava/lang/String;

.field final synthetic zzbtl:Lcom/google/android/gms/internal/zzgg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgg;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgg$5;->zzbtl:Lcom/google/android/gms/internal/zzgg;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgg$5;->zzbtg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgg$5;->zzbtl:Lcom/google/android/gms/internal/zzgg;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgg;->zza(Lcom/google/android/gms/internal/zzgg;)Lcom/google/android/gms/internal/zzmd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgg$5;->zzbtg:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzmd;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
