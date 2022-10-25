.class Lcom/google/android/gms/internal/zziz$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zziz;->zzfp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzamz:Lcom/google/android/gms/internal/zzko;

.field final synthetic zzchi:Lcom/google/android/gms/internal/zziz;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zziz;Lcom/google/android/gms/internal/zzko;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zziz$1;->zzchi:Lcom/google/android/gms/internal/zziz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zziz$1;->zzamz:Lcom/google/android/gms/internal/zzko;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zziz$1;->zzchi:Lcom/google/android/gms/internal/zziz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zziz;->zza(Lcom/google/android/gms/internal/zziz;)Lcom/google/android/gms/internal/zziu$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zziz$1;->zzamz:Lcom/google/android/gms/internal/zzko;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zziu$zza;->zzb(Lcom/google/android/gms/internal/zzko;)V

    return-void
.end method
