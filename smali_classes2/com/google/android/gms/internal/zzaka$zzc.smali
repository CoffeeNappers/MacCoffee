.class Lcom/google/android/gms/internal/zzaka$zzc;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaix;
.implements Lcom/google/android/gms/internal/zzaka$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaka;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzc"
.end annotation


# instance fields
.field private final bfE:Lcom/google/android/gms/internal/zzalm;

.field private final bfF:Lcom/google/android/gms/internal/zzakb;

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzalm;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzalm;->zzcyi()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfF:Lcom/google/android/gms/internal/zzakb;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka$zzc;)Lcom/google/android/gms/internal/zzakb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfF:Lcom/google/android/gms/internal/zzakb;

    return-object v0
.end method


# virtual methods
.method public zzb(Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/DatabaseError;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalm;->zzcyi()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfF:Lcom/google/android/gms/internal/zzakb;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfr:Lcom/google/android/gms/internal/zzaka;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfF:Lcom/google/android/gms/internal/zzakb;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzaka;->zzt(Lcom/google/android/gms/internal/zzajq;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalm;->zzcyi()Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/firebase/database/DatabaseError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x13

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "Listen at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalw;->warn(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfr:Lcom/google/android/gms/internal/zzaka;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalm;->zzcyi()Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public zzcsm()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalm;->zzcyj()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzczd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcsn()Z
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalm;->zzcyj()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzani;->zzt(Lcom/google/android/gms/internal/zzaml;)J

    move-result-wide v0

    const-wide/16 v2, 0x400

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcso()Lcom/google/android/gms/internal/zzair;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzc;->bfE:Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalm;->zzcyj()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamb;->zzi(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamb;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzamb;->zzcsf()Ljava/util/List;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzair;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzamb;->zzcsg()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/internal/zzair;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method
