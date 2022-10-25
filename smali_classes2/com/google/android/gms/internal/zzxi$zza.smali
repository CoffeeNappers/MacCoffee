.class Lcom/google/android/gms/internal/zzxi$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzxi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zza"
.end annotation


# static fields
.field private static final aCP:[Ljava/lang/String;


# instance fields
.field private final aCM:Ljava/lang/String;

.field private final aCQ:Landroid/net/Uri;

.field private final aCR:Ljava/net/URI;

.field private final aCS:Ljava/lang/Boolean;

.field private final aCT:Ljava/lang/Integer;

.field private final gl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "http"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "https"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "ftp"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/internal/zzxi$zza;->aCP:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCQ:Landroid/net/Uri;

    :try_start_0
    new-instance v0, Ljava/net/URI;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCR:Ljava/net/URI;

    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzxi$zza;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCM:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzxi$zza;->zzccw()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCS:Ljava/lang/Boolean;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzxi$zza;->zzccv()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCT:Ljava/lang/Integer;

    return-void

    :catch_0
    move-exception v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCR:Ljava/net/URI;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCR:Ljava/net/URI;

    throw v0
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzxi$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzxi$zza;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private getPort()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private getScheme()Ljava/lang/String;
    .locals 5

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCM:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCM:Ljava/lang/String;

    :cond_0
    :goto_0
    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCQ:Landroid/net/Uri;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCQ:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    iget-object v3, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzxi$zza;->zzom(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    move-object v0, v2

    :cond_3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->gl:Ljava/lang/String;

    const-string/jumbo v2, "www."

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string/jumbo v0, "http"

    :cond_4
    :goto_2
    if-eqz v0, :cond_0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_5
    const-string/jumbo v0, "http"

    goto :goto_2

    :cond_6
    move-object v0, v1

    goto :goto_1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzxi$zza;)Z
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzxi$zza;->zzccw()Z

    move-result v0

    return v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzxi$zza;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzxi$zza;->getScheme()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzxi$zza;)I
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzxi$zza;->getPort()I

    move-result v0

    return v0
.end method

.method private zzccv()I
    .locals 2

    const/4 v1, -0x1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCT:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCQ:Landroid/net/Uri;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCQ:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v0

    if-ne v0, v1, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method private zzccw()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCS:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCS:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxi$zza;->aCM:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzxi$zza;->zzom(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method private static zzom(Ljava/lang/String;)Z
    .locals 3

    const/4 v1, 0x0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    move v0, v1

    :goto_1
    sget-object v2, Lcom/google/android/gms/internal/zzxi$zza;->aCP:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    sget-object v2, Lcom/google/android/gms/internal/zzxi$zza;->aCP:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
