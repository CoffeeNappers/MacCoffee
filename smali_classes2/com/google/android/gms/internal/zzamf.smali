.class public abstract Lcom/google/android/gms/internal/zzamf;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/google/android/gms/internal/zzamk;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zzsy(Ljava/lang/String;)Lcom/google/android/gms/internal/zzamf;
    .locals 2

    const-string/jumbo v0, ".value"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzams;->d()Lcom/google/android/gms/internal/zzams;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ".key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzamh;->zzczx()Lcom/google/android/gms/internal/zzamh;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string/jumbo v0, ".priority"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "queryDefinition shouldn\'t ever be .priority since it\'s the default"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/zzamn;

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzamn;-><init>(Lcom/google/android/gms/internal/zzajq;)V

    goto :goto_0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;Z)I
    .locals 1

    if-eqz p3, :cond_0

    invoke-virtual {p0, p2, p1}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Z
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzczr()Lcom/google/android/gms/internal/zzamk;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/zzamk;->zzczy()Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    return-object v0
.end method

.method public abstract zzczs()Lcom/google/android/gms/internal/zzamk;
.end method

.method public abstract zzczt()Ljava/lang/String;
.end method

.method public abstract zzg(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamk;
.end method

.method public abstract zzm(Lcom/google/android/gms/internal/zzaml;)Z
.end method
