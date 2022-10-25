.class Lcom/google/android/gms/internal/zzaic$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaic;->zza(ZLcom/google/android/gms/internal/zzajf$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnSuccessListener",
        "<",
        "Lcom/google/firebase/auth/GetTokenResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic aZG:Lcom/google/android/gms/internal/zzajf$zza;

.field final synthetic aZH:Lcom/google/android/gms/internal/zzaic;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaic;Lcom/google/android/gms/internal/zzajf$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaic$2;->aZH:Lcom/google/android/gms/internal/zzaic;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaic$2;->aZG:Lcom/google/android/gms/internal/zzajf$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/firebase/auth/GetTokenResult;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaic$2;->zza(Lcom/google/firebase/auth/GetTokenResult;)V

    return-void
.end method

.method public zza(Lcom/google/firebase/auth/GetTokenResult;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaic$2;->aZG:Lcom/google/android/gms/internal/zzajf$zza;

    invoke-virtual {p1}, Lcom/google/firebase/auth/GetTokenResult;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajf$zza;->zzsi(Ljava/lang/String;)V

    return-void
.end method
