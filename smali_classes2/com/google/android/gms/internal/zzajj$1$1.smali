.class Lcom/google/android/gms/internal/zzajj$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajf$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajj$1;->zza(ZLcom/google/android/gms/internal/zzait$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bcE:Lcom/google/android/gms/internal/zzait$zza;

.field final synthetic bds:Lcom/google/android/gms/internal/zzajj$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajj$1;Lcom/google/android/gms/internal/zzait$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajj$1$1;->bds:Lcom/google/android/gms/internal/zzajj$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajj$1$1;->bcE:Lcom/google/android/gms/internal/zzait$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj$1$1;->bcE:Lcom/google/android/gms/internal/zzait$zza;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzait$zza;->onError(Ljava/lang/String;)V

    return-void
.end method

.method public zzsi(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajj$1$1;->bcE:Lcom/google/android/gms/internal/zzait$zza;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzait$zza;->zzsi(Ljava/lang/String;)V

    return-void
.end method
