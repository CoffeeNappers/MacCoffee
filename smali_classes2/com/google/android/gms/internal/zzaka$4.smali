.class Lcom/google/android/gms/internal/zzaka$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/google/android/gms/internal/zzalh;",
        ">;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic bep:Lcom/google/android/gms/internal/zzall;

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;

.field final synthetic bfu:Lcom/google/android/gms/internal/zzajl;

.field final synthetic bfv:Lcom/google/firebase/database/DatabaseError;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzaka$4;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaka$4;->bfu:Lcom/google/android/gms/internal/zzajl;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaka$4;->bfv:Lcom/google/firebase/database/DatabaseError;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$4;->zzbym()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzbym()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_c

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzajz;->zzc(Lcom/google/android/gms/internal/zzall;)Z

    move-result v2

    if-eqz v2, :cond_c

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfu:Lcom/google/android/gms/internal/zzajl;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$4;->bfv:Lcom/google/firebase/database/DatabaseError;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzajz;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)Lcom/google/android/gms/internal/zzank;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/zzakz;->zzaj(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;

    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzank;->A()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v3, v4

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzall;

    iget-object v7, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v7

    iget-object v9, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-interface {v7, v9}, Lcom/google/android/gms/internal/zzaku;->zzh(Lcom/google/android/gms/internal/zzall;)V

    if-nez v3, :cond_2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    move v2, v5

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_3
    move v2, v4

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzajz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajz;->zzcvy()Z

    move-result v2

    if-eqz v2, :cond_7

    move v2, v5

    :goto_2
    invoke-virtual {v8}, Lcom/google/android/gms/internal/zzajq;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move-object v7, v6

    move v6, v2

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v7, v2}, Lcom/google/android/gms/internal/zzakz;->zze(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v7

    if-nez v6, :cond_5

    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzajz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajz;->zzcvy()Z

    move-result v2

    if-eqz v2, :cond_8

    :cond_5
    move v2, v5

    :goto_4
    if-nez v2, :cond_f

    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzakz;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_9

    move v6, v2

    :cond_6
    :goto_5
    if-eqz v3, :cond_a

    if-nez v6, :cond_a

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzakz;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_a

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v4, v2}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakz;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzalm;

    new-instance v5, Lcom/google/android/gms/internal/zzaka$zzc;

    iget-object v7, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-direct {v5, v7, v2}, Lcom/google/android/gms/internal/zzaka$zzc;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzalm;)V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzalm;->zzcyi()Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    iget-object v7, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzaka;->zzh(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaka$zzd;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v8, v2}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    invoke-static {v5}, Lcom/google/android/gms/internal/zzaka$zzc;->zza(Lcom/google/android/gms/internal/zzaka$zzc;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v8

    invoke-interface {v7, v2, v8, v5, v5}, Lcom/google/android/gms/internal/zzaka$zzd;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaka$zza;)V

    goto :goto_6

    :cond_7
    move v2, v4

    goto :goto_2

    :cond_8
    move v2, v4

    goto :goto_4

    :cond_9
    move v6, v2

    goto :goto_3

    :cond_a
    if-nez v6, :cond_b

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfv:Lcom/google/firebase/database/DatabaseError;

    if-nez v2, :cond_b

    if-eqz v3, :cond_d

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zzh(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaka$zzd;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaka$4;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Lcom/google/android/gms/internal/zzaka$zzd;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;)V

    :cond_b
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Ljava/util/List;)V

    :cond_c
    return-object v1

    :cond_d
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzall;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v4, v2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v4

    sget-boolean v5, Lcom/google/android/gms/internal/zzaka$4;->$assertionsDisabled:Z

    if-nez v5, :cond_e

    if-nez v4, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_e
    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzaka;->zzh(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaka$zzd;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/gms/internal/zzaka$4;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v6, v2}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    invoke-interface {v5, v2, v4}, Lcom/google/android/gms/internal/zzaka$zzd;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;)V

    goto :goto_7

    :cond_f
    move v6, v2

    goto/16 :goto_5
.end method
