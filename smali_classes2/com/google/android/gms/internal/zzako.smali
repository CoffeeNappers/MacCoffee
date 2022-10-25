.class public Lcom/google/android/gms/internal/zzako;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzako$zza;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final bgp:Lcom/google/android/gms/internal/zzako;

.field public static final bgq:Lcom/google/android/gms/internal/zzako;


# instance fields
.field private final bgr:Lcom/google/android/gms/internal/zzako$zza;

.field private final bgs:Lcom/google/android/gms/internal/zzalk;

.field private final bgt:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x0

    const/4 v1, 0x0

    const-class v0, Lcom/google/android/gms/internal/zzako;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzako;->$assertionsDisabled:Z

    new-instance v0, Lcom/google/android/gms/internal/zzako;

    sget-object v2, Lcom/google/android/gms/internal/zzako$zza;->bgu:Lcom/google/android/gms/internal/zzako$zza;

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzako;-><init>(Lcom/google/android/gms/internal/zzako$zza;Lcom/google/android/gms/internal/zzalk;Z)V

    sput-object v0, Lcom/google/android/gms/internal/zzako;->bgp:Lcom/google/android/gms/internal/zzako;

    new-instance v0, Lcom/google/android/gms/internal/zzako;

    sget-object v2, Lcom/google/android/gms/internal/zzako$zza;->bgv:Lcom/google/android/gms/internal/zzako$zza;

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzako;-><init>(Lcom/google/android/gms/internal/zzako$zza;Lcom/google/android/gms/internal/zzalk;Z)V

    sput-object v0, Lcom/google/android/gms/internal/zzako;->bgq:Lcom/google/android/gms/internal/zzako;

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzako$zza;Lcom/google/android/gms/internal/zzalk;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzako;->bgr:Lcom/google/android/gms/internal/zzako$zza;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzako;->bgs:Lcom/google/android/gms/internal/zzalk;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzako;->bgt:Z

    sget-boolean v0, Lcom/google/android/gms/internal/zzako;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzako;->zzcws()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    return-void
.end method

.method public static zzc(Lcom/google/android/gms/internal/zzalk;)Lcom/google/android/gms/internal/zzako;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzako;

    sget-object v1, Lcom/google/android/gms/internal/zzako$zza;->bgv:Lcom/google/android/gms/internal/zzako$zza;

    const/4 v2, 0x1

    invoke-direct {v0, v1, p0, v2}, Lcom/google/android/gms/internal/zzako;-><init>(Lcom/google/android/gms/internal/zzako$zza;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzako;->bgr:Lcom/google/android/gms/internal/zzako$zza;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzako;->bgs:Lcom/google/android/gms/internal/zzalk;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzako;->bgt:Z

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x34

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "OperationSource{source="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, ", queryParams="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", tagged="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcwr()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzako;->bgr:Lcom/google/android/gms/internal/zzako$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzako$zza;->bgu:Lcom/google/android/gms/internal/zzako$zza;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcws()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzako;->bgr:Lcom/google/android/gms/internal/zzako$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzako$zza;->bgv:Lcom/google/android/gms/internal/zzako$zza;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcwt()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzako;->bgt:Z

    return v0
.end method

.method public zzcwu()Lcom/google/android/gms/internal/zzalk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzako;->bgs:Lcom/google/android/gms/internal/zzalk;

    return-object v0
.end method
