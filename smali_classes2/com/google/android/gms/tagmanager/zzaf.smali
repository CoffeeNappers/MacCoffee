.class Lcom/google/android/gms/tagmanager/zzaf;
.super Lcom/google/android/gms/tagmanager/zzam;


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final aFk:Ljava/lang/String;

.field private static final aFl:Ljava/lang/String;

.field private static final aFm:Ljava/lang/String;

.field private static final aFn:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzag;->zzim:Lcom/google/android/gms/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzag;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzaf;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzah;->zzmm:Lcom/google/android/gms/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzah;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFk:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzah;->zzrs:Lcom/google/android/gms/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzah;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFl:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzah;->zzql:Lcom/google/android/gms/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzah;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFm:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzah;->zzsc:Lcom/google/android/gms/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzah;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFn:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    sget-object v0, Lcom/google/android/gms/tagmanager/zzaf;->ID:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/android/gms/tagmanager/zzaf;->aFk:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzam;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public zzay(Ljava/util/Map;)Lcom/google/android/gms/internal/zzaj$zza;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzaj$zza;",
            ">;)",
            "Lcom/google/android/gms/internal/zzaj$zza;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFk:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaj$zza;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdm;->zzchm()Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v1

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdm;->zzchm()Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdm;->zzg(Lcom/google/android/gms/internal/zzaj$zza;)Ljava/lang/String;

    move-result-object v4

    sget-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFm:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaj$zza;

    if-nez v0, :cond_2

    const-string/jumbo v0, "text"

    move-object v1, v0

    :goto_1
    sget-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFn:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaj$zza;

    if-nez v0, :cond_3

    const-string/jumbo v0, "base16"

    move-object v2, v0

    :goto_2
    const/4 v3, 0x2

    sget-object v0, Lcom/google/android/gms/tagmanager/zzaf;->aFl:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaj$zza;

    if-eqz v0, :cond_d

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdm;->zzk(Lcom/google/android/gms/internal/zzaj$zza;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x3

    :goto_3
    :try_start_0
    const-string/jumbo v3, "text"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_4
    const-string/jumbo v3, "base16"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzk;->zzq([B)Ljava/lang/String;

    move-result-object v0

    :goto_5
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdm;->zzat(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdm;->zzg(Lcom/google/android/gms/internal/zzaj$zza;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    :cond_3
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdm;->zzg(Lcom/google/android/gms/internal/zzaj$zza;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    goto :goto_2

    :cond_4
    :try_start_1
    const-string/jumbo v3, "base16"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzk;->zzos(Ljava/lang/String;)[B

    move-result-object v1

    goto :goto_4

    :cond_5
    const-string/jumbo v3, "base64"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-static {v4, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    goto :goto_4

    :cond_6
    const-string/jumbo v3, "base64url"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    or-int/lit8 v1, v0, 0x8

    invoke-static {v4, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    goto :goto_4

    :cond_7
    const-string/jumbo v2, "Encode: unknown input format: "

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbo;->e(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdm;->zzchm()Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    goto/16 :goto_0

    :cond_8
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Encode: invalid input:"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbo;->e(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdm;->zzchm()Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    goto/16 :goto_0

    :cond_9
    const-string/jumbo v3, "base64"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-static {v1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_a
    const-string/jumbo v3, "base64url"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    or-int/lit8 v0, v0, 0x8

    invoke-static {v1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :cond_b
    const-string/jumbo v1, "Encode: unknown output format: "

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_c

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_7
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbo;->e(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdm;->zzchm()Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    goto/16 :goto_0

    :cond_c
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_7

    :cond_d
    move v0, v3

    goto/16 :goto_3
.end method

.method public zzcdu()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
