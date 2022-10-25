.class public Lcom/google/android/gms/internal/zzxc;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/safetynet/SafetyNetApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzxc$zzh;,
        Lcom/google/android/gms/internal/zzxc$zze;,
        Lcom/google/android/gms/internal/zzxc$zzd;,
        Lcom/google/android/gms/internal/zzxc$zzg;,
        Lcom/google/android/gms/internal/zzxc$zzc;,
        Lcom/google/android/gms/internal/zzxc$zzj;,
        Lcom/google/android/gms/internal/zzxc$zzi;,
        Lcom/google/android/gms/internal/zzxc$zzf;,
        Lcom/google/android/gms/internal/zzxc$zza;,
        Lcom/google/android/gms/internal/zzxc$zzb;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field protected static aCk:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/gms/internal/zzxh;",
            ">;"
        }
    .end annotation
.end field

.field protected static aCl:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzxc;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzxc;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public attest(Lcom/google/android/gms/common/api/GoogleApiClient;[B)Lcom/google/android/gms/common/api/PendingResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "[B)",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzxc$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzxc$1;-><init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;[B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method

.method public enableVerifyApps(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$zzc;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzxc$4;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzxc$4;-><init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method

.method public isVerifyAppsEnabled(Landroid/content/Context;)Z
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzxj;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzxj;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzxj;->zzccx()Z

    move-result v0

    return v0
.end method

.method public listHarmfulApps(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$zza;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzxc$5;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzxc$5;-><init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method

.method public varargs lookupUri(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;[I)Lcom/google/android/gms/common/api/PendingResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Ljava/lang/String;",
            "[I)",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$SafeBrowsingResult;",
            ">;"
        }
    .end annotation

    array-length v0, p3

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null threatTypes in lookupUri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null or empty uri in lookupUri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzxc$3;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/google/android/gms/internal/zzxc$3;-><init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;[ILjava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method

.method public lookupUri(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$SafeBrowsingResult;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/gms/internal/zzxc;->zza(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    return-object v0
.end method

.method public varargs lookupUriInLocalBlacklist(Ljava/lang/String;[I)Z
    .locals 8

    const/4 v3, 0x0

    const/4 v2, 0x1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null threatTypes in lookupUri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null or empty uri in lookupUri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzxc;->aCk:Landroid/util/SparseArray;

    if-eqz v0, :cond_2

    sget-wide v0, Lcom/google/android/gms/internal/zzxc;->aCl:J

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-eqz v0, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v4, Lcom/google/android/gms/internal/zzxc;->aCl:J

    sub-long/2addr v0, v4

    const-wide/32 v4, 0x124f80

    cmp-long v0, v0, v4

    if-ltz v0, :cond_3

    :cond_2
    move v0, v2

    :goto_0
    return v0

    :cond_3
    sget-object v0, Lcom/google/android/gms/internal/zzxc;->aCk:Landroid/util/SparseArray;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/google/android/gms/internal/zzxc;->aCk:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-eqz v0, :cond_a

    new-instance v0, Lcom/google/android/gms/internal/zzxi;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzxi;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzxi;->zzccs()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    move v0, v2

    goto :goto_0

    :cond_5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzxf;

    array-length v6, p2

    move v4, v3

    :goto_1
    if-ge v4, v6, :cond_6

    aget v1, p2, v4

    sget-object v7, Lcom/google/android/gms/internal/zzxc;->aCk:Landroid/util/SparseArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzxh;

    if-eqz v1, :cond_7

    const/4 v7, 0x4

    invoke-virtual {v0, v7}, Lcom/google/android/gms/internal/zzxf;->zzzr(I)Lcom/google/android/gms/internal/zzxf;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzxf;->getBytes()[B

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/google/android/gms/internal/zzxh;->zzah([B)Z

    move-result v1

    if-eqz v1, :cond_8

    move v0, v2

    goto :goto_0

    :cond_7
    move v0, v2

    goto :goto_0

    :cond_8
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_1

    :cond_9
    move v0, v3

    goto :goto_0

    :cond_a
    move v0, v2

    goto :goto_0
.end method

.method public verifyWithRecaptcha(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$zzb;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzxc$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzxc$6;-><init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/safetynet/SafetyNetApi$SafeBrowsingResult;",
            ">;"
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null threatTypes in lookupUri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null or empty uri in lookupUri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzxc$2;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzxc$2;-><init>(Lcom/google/android/gms/internal/zzxc;Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method
