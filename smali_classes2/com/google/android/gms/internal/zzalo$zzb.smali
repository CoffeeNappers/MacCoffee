.class Lcom/google/android/gms/internal/zzalo$zzb;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzals$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzalo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field private final bhT:Lcom/google/android/gms/internal/zzaln;

.field private final bid:Lcom/google/android/gms/internal/zzaki;

.field private final bie:Lcom/google/android/gms/internal/zzaml;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzaln;Lcom/google/android/gms/internal/zzaml;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bid:Lcom/google/android/gms/internal/zzaki;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bhT:Lcom/google/android/gms/internal/zzaln;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bie:Lcom/google/android/gms/internal/zzaml;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzamk;Z)Lcom/google/android/gms/internal/zzamk;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bie:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bie:Lcom/google/android/gms/internal/zzaml;

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bid:Lcom/google/android/gms/internal/zzaki;

    invoke-virtual {v1, v0, p2, p3, p1}, Lcom/google/android/gms/internal/zzaki;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamk;ZLcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyo()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    goto :goto_0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyl()Lcom/google/android/gms/internal/zzald;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzald;->zzf(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bie:Lcom/google/android/gms/internal/zzaml;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzald;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bie:Lcom/google/android/gms/internal/zzaml;

    invoke-static {}, Lcom/google/android/gms/internal/zzamh;->zzczx()Lcom/google/android/gms/internal/zzamh;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bid:Lcom/google/android/gms/internal/zzaki;

    invoke-virtual {v1, p1, v0}, Lcom/google/android/gms/internal/zzaki;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzald;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalo$zzb;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyn()Lcom/google/android/gms/internal/zzald;

    move-result-object v0

    goto :goto_1
.end method
