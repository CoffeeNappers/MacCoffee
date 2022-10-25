.class Lcom/google/android/gms/internal/zzajs$8;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzajq;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic bdc:Lcom/google/android/gms/internal/zzajq;

.field final synthetic beg:Ljava/util/List;

.field final synthetic beh:Lcom/google/android/gms/internal/zzajs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Ljava/util/List;Lcom/google/android/gms/internal/zzajs;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$8;->bdc:Lcom/google/android/gms/internal/zzajq;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajs$8;->beg:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzajs$8;->beh:Lcom/google/android/gms/internal/zzajs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    const/4 v4, 0x0

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzajs;->zzbp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    const-string/jumbo v2, "Transaction"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$8;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Ljava/lang/String;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    if-nez v1, :cond_1

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->beg:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs$zza;

    sget-object v1, Lcom/google/android/gms/internal/zzajs$zzb;->beM:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajs;->zzg(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaka;

    move-result-object v1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v2

    iget-object v5, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzajs;->zzh(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzanj;

    move-result-object v6

    move v5, v4

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzh(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$8;->beh:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v2

    invoke-static {v1}, Lcom/google/android/gms/internal/zzamg;->zzn(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzamg;)Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzajs$8$1;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/android/gms/internal/zzajs$8$1;-><init>(Lcom/google/android/gms/internal/zzajs$8;Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/firebase/database/DataSnapshot;)V

    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    new-instance v2, Lcom/google/android/gms/internal/zzakg;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzj(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/firebase/database/ValueEventListener;

    move-result-object v5

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-direct {v2, v3, v5, v0}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzajs;->zze(Lcom/google/android/gms/internal/zzajl;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajs;->zzi(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$8;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzalb;->zzal(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzalb;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs;->zzj(Lcom/google/android/gms/internal/zzajs;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->beh:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0, v7}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V

    :goto_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    if-ge v4, v0, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzajs;->zzq(Ljava/lang/Runnable;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lcom/google/firebase/database/DatabaseError;->getCode()I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->beg:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/zzajs$zzb;->beN:Lcom/google/android/gms/internal/zzajs$zzb;

    if-ne v2, v3, :cond_2

    sget-object v2, Lcom/google/android/gms/internal/zzajs$zzb;->beO:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    goto :goto_2

    :cond_2
    sget-object v2, Lcom/google/android/gms/internal/zzajs$zzb;->beK:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->beg:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs$zza;

    sget-object v3, Lcom/google/android/gms/internal/zzajs$zzb;->beO:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v3}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/firebase/database/DatabaseError;)Lcom/google/firebase/database/DatabaseError;

    goto :goto_3

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$8;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    :cond_5
    return-void
.end method
