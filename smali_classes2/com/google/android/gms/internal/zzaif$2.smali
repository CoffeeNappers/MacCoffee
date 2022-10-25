.class Lcom/google/android/gms/internal/zzaif$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzakz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaif;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzakw;Ljava/util/List;)V
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
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic aZU:Lcom/google/android/gms/internal/zzakz;

.field final synthetic aZV:Lcom/google/android/gms/internal/zzaif;

.field final synthetic aZW:Ljava/util/List;

.field final synthetic aZX:Lcom/google/android/gms/internal/zzajq;

.field final synthetic aZY:Lcom/google/android/gms/internal/zzaml;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaif;Lcom/google/android/gms/internal/zzakz;Ljava/util/List;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaif$2;->aZV:Lcom/google/android/gms/internal/zzaif;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaif$2;->aZU:Lcom/google/android/gms/internal/zzakz;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaif$2;->aZW:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaif$2;->aZX:Lcom/google/android/gms/internal/zzajq;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzaif$2;->aZY:Lcom/google/android/gms/internal/zzaml;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p2, Ljava/lang/Void;

    check-cast p3, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaif$2;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Void;Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Void;Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaif$2;->aZU:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaif$2;->aZW:Ljava/util/List;

    new-instance v1, Lcom/google/android/gms/internal/zzank;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaif$2;->aZX:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaif$2;->aZY:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v3, p1}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzank;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
