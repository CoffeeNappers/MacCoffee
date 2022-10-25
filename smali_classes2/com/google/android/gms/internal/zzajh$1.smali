.class Lcom/google/android/gms/internal/zzajh$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzakz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajh;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)Lcom/google/android/gms/internal/zzajh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzakz$zza",
        "<",
        "Lcom/google/android/gms/internal/zzaml;",
        "Lcom/google/android/gms/internal/zzajh;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic bdc:Lcom/google/android/gms/internal/zzajq;

.field final synthetic bdd:Lcom/google/android/gms/internal/zzajh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajh$1;->bdd:Lcom/google/android/gms/internal/zzajh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajh$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajh;)Lcom/google/android/gms/internal/zzajh;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajh$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {p3, v0, p2}, Lcom/google/android/gms/internal/zzajh;->zze(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p2, Lcom/google/android/gms/internal/zzaml;

    check-cast p3, Lcom/google/android/gms/internal/zzajh;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzajh$1;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajh;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v0

    return-object v0
.end method
